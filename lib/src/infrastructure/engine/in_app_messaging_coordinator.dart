import 'dart:async';

import '../../domain/entities/iam_enums.dart';
import '../../domain/entities/iam_message_state.dart';
import '../../domain/entities/iam_trigger_context.dart';
import '../../domain/entities/in_app_message.dart';
import '../../domain/iam_host_bindings.dart';
import '../../presentation/renderers/bottom_sheet_iam_renderer.dart';
import '../../presentation/renderers/fullscreen_iam_renderer.dart';
import '../../presentation/renderers/iam_renderer.dart';
import '../../presentation/renderers/image_only_modal_iam_renderer.dart';
import '../../presentation/renderers/modal_iam_renderer.dart';
import '../state/iam_state_store.dart';
import 'iam_analytics_mapper.dart';
import 'iam_cta_dispatcher.dart';
import 'iam_message_repository.dart';
import 'in_app_messaging_engine.dart';

/// Orchestrates evaluation → render → analytics → persistence for a single
/// trigger tick. Serializes display with a re-entrancy lock so that only one
/// message is ever on screen at a time.
///
/// Responsibilities are split across collaborators (SRP):
/// - [IamMessageRepository] — JSON load + parse + cache.
/// - [InAppMessagingEngine] — eligibility evaluation + variant selection.
/// - [IamCtaDispatcher] — action map for `close` / `deepLink` / `externalUrl`.
/// - [IamAnalyticsMapper] — analytics parameter shaping.
class InAppMessagingCoordinator {
  InAppMessagingCoordinator({
    required IamHostBindings bindings,
    required InAppMessagingEngine engine,
    required IamStateStore store,
    Map<IamLayout, IamRenderer>? renderers,
    IamMessageRepository? repository,
    IamCtaDispatcher? ctaDispatcher,
    IamAnalyticsMapper? analyticsMapper,
  }) : _bindings = bindings,
       _engine = engine,
       _store = store,
       _renderers =
           renderers ??
           const <IamLayout, IamRenderer>{
             IamLayout.modal: ModalIamRenderer(),
             IamLayout.bottomSheet: BottomSheetIamRenderer(),
             IamLayout.fullscreen: FullscreenIamRenderer(),
             IamLayout.imageOnlyModal: ImageOnlyModalIamRenderer(),
           },
       _repository =
           repository ?? IamMessageRepository(bindings: bindings),
       _ctaDispatcher =
           ctaDispatcher ?? IamCtaDispatcher(bindings: bindings),
       _analyticsMapper = analyticsMapper ?? const IamAnalyticsMapper();

  final IamHostBindings _bindings;
  final InAppMessagingEngine _engine;
  final IamStateStore _store;
  final Map<IamLayout, IamRenderer> _renderers;
  final IamMessageRepository _repository;
  final IamCtaDispatcher _ctaDispatcher;
  final IamAnalyticsMapper _analyticsMapper;

  bool _showing = false;

  /// Public entry point. Safe to call repeatedly; no-op while a message is on
  /// screen or when the global kill-switch is off.
  Future<void> onTrigger(IamTriggerContext ctx) async {
    if (_showing) return;
    if (!_bindings.isEnabled()) return;

    try {
      final messages = await _loadMessages();
      final eligible = await _engine.evaluate(
        messages: messages,
        triggerCtx: ctx,
        user: _bindings.currentUser(),
        globallyEnabled: _bindings.isEnabled(),
      );
      if (eligible == null) return;
      await _present(eligible, ctx);
    } catch (e, st) {
      _bindings.logError(e, st, 'InAppMessagingCoordinator.onTrigger');
    }
  }

  Future<List<InAppMessage>> _loadMessages() => _repository.load();

  /// Forces re-parsing on the next trigger (e.g., Remote Config refresh).
  void invalidateCache() => _repository.invalidate();

  Future<void> _present(
    EligibleMessage eligible,
    IamTriggerContext ctx,
  ) async {
    final renderer = _renderers[eligible.message.layout];
    if (renderer == null) {
      _bindings.logInfo(
        'IAM skipped: no renderer for layout',
        data: <String, Object?>{'layout': eligible.message.layout.name},
      );
      return;
    }

    _showing = true;
    try {
      // Honor `trigger.delayMs` from Remote Config. Applied *before* resolving
      // the navigator context so that if the user navigates during the wait,
      // we re-check context validity below.
      final delayMs = eligible.message.trigger.delayMs;
      if (delayMs > 0) {
        await Future<void>.delayed(Duration(milliseconds: delayMs));
      }

      final context = _bindings.navigatorKey.currentContext;
      if (context == null) {
        _bindings.logInfo('IAM deferred: navigator context not ready');
        return;
      }

      // Record impression + track `iam_message_shown` BEFORE awaiting display
      // so dismiss analytics reflect the same session.
      await _recordImpression(eligible);
      _bindings.trackEvent(
        'iam_message_shown',
        _analyticsMapper.baseParams(eligible, ctx),
      );

      if (!context.mounted) {
        _bindings.logInfo('IAM deferred: navigator context not mounted');
        return;
      }

      final result = await renderer.show(
        context: context,
        content: eligible.variant.content,
        showCloseButton: eligible.message.showCloseButton,
      );

      if (result.outcome == IamRenderOutcome.ctaTapped && result.cta != null) {
        await _handleCta(eligible, ctx, result);
      } else {
        await _handleDismiss(eligible, ctx);
      }
    } finally {
      _showing = false;
    }
  }

  Future<void> _recordImpression(EligibleMessage eligible) async {
    await _store.mutate(eligible.message.id, (IamMessageState s) {
      return s.copyWith(
        impressions: s.impressions + 1,
        lastShownAt: DateTime.now(),
        stickyVariantIndex: s.stickyVariantIndex ?? eligible.variantIndex,
      );
    });
  }

  Future<void> _handleCta(
    EligibleMessage eligible,
    IamTriggerContext ctx,
    IamRenderResult result,
  ) async {
    final cta = result.cta!;
    final params = _analyticsMapper.baseParams(eligible, ctx)
      ..addAll(<String, dynamic>{
        'cta_label': cta.label,
        'action': cta.action.name,
        if (cta.url != null) 'url': cta.url,
      });
    _bindings.trackEvent('iam_cta_clicked', params);

    await _store.mutate(
      eligible.message.id,
      (IamMessageState s) => s.copyWith(ctaClicked: true),
    );

    final outcome = await _ctaDispatcher.dispatch(
      IamCtaActionParams(cta: cta),
    );
    if (outcome == IamCtaResult.invalidPath) {
      _bindings.trackEvent('iam_cta_invalid_path', params);
    }
  }

  Future<void> _handleDismiss(
    EligibleMessage eligible,
    IamTriggerContext ctx,
  ) async {
    final doNotShowAgain =
        eligible.message.frequency.dismissBehavior ==
        IamDismissBehavior.doNotShowAgain;
    if (doNotShowAgain) {
      await _store.mutate(
        eligible.message.id,
        (IamMessageState s) => s.copyWith(dismissed: true),
      );
    }
    _bindings.trackEvent(
      'iam_dismissed',
      _analyticsMapper.baseParams(eligible, ctx),
    );
  }
}
