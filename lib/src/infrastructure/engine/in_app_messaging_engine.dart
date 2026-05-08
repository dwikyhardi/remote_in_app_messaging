import '../../domain/entities/iam_enums.dart';
import '../../domain/entities/iam_message_state.dart';
import '../../domain/entities/iam_trigger_context.dart';
import '../../domain/entities/iam_user_context.dart';
import '../../domain/entities/iam_variant.dart';
import '../../domain/entities/in_app_message.dart';
import '../state/iam_state_store.dart';
import '../util/semver.dart';
import 'iam_variant_picker.dart';

/// Result of a successful engine evaluation: the selected message plus the
/// resolved variant (already sticky-persisted).
class EligibleMessage {
  const EligibleMessage({
    required this.message,
    required this.variantIndex,
    required this.variant,
  });

  final InAppMessage message;
  final int variantIndex;
  final IamVariant variant;
}

/// Pure evaluator that, given the current campaign list and a trigger/user
/// context, returns at most one eligible [EligibleMessage].
///
/// Pipeline (in order): global-enabled → per-message `enabled` → schedule
/// window → trigger match → targeting → frequency → variant pick.
class InAppMessagingEngine {
  InAppMessagingEngine({
    required IamStateStore stateStore,
    DateTime Function()? now,
    void Function(String message)? logInfo,
    IamVariantPicker? variantPicker,
  }) : _store = stateStore,
       _now = now ?? DateTime.now,
       _logInfo = logInfo,
       _variantPicker = variantPicker ?? const IamVariantPicker();

  final IamStateStore _store;
  final DateTime Function() _now;
  final void Function(String message)? _logInfo;
  final IamVariantPicker _variantPicker;

  void _log(String message) => _logInfo?.call(message);

  /// Evaluates [messages] against [triggerCtx] + [user]. Returns the first
  /// eligible message, or `null` if none qualify.
  ///
  /// When [globallyEnabled] is `false`, evaluation short-circuits.
  Future<EligibleMessage?> evaluate({
    required List<InAppMessage> messages,
    required IamTriggerContext triggerCtx,
    required IamUserContext user,
    required bool globallyEnabled,
  }) async {
    if (!globallyEnabled) return null;
    final now = _now();

    for (final message in messages) {
      if (!message.enabled) {
        _log('IAM skipped ${message.id}: message disabled');
        continue;
      }
      if (!_isWithinSchedule(message, now)) {
        _log('IAM skipped ${message.id}: outside schedule window');
        continue;
      }
      if (!_matchesTrigger(message, triggerCtx)) {
        _log(
          'IAM skipped ${message.id}: trigger mismatch '
          '(declared=${message.trigger.type.name}, ctx=$triggerCtx)',
        );
        continue;
      }
      if (!_matchesTargeting(message, user)) {
        _log('IAM skipped ${message.id}: targeting mismatch');
        continue;
      }

      final state = _store.read(message.id) ?? const IamMessageState();
      if (!_passesFrequency(message, state)) {
        _log(
          'IAM skipped ${message.id}: frequency cap '
          '(impressions=${state.impressions}/${message.frequency.maxImpressions}, '
          'dismissed=${state.dismissed}, '
          'behavior=${message.frequency.dismissBehavior.name})',
        );
        continue;
      }

      final pick = await _pickVariant(message, user, state);
      if (pick == null) {
        _log('IAM skipped ${message.id}: no variant available');
        continue;
      }

      return EligibleMessage(
        message: message,
        variantIndex: pick.index,
        variant: message.variants[pick.index],
      );
    }
    return null;
  }

  // ---------------------------------------------------------------------------
  // Pipeline stages
  // ---------------------------------------------------------------------------

  bool _isWithinSchedule(InAppMessage m, DateTime now) {
    if (m.startAt != null && now.isBefore(m.startAt!)) return false;
    if (m.endAt != null && now.isAfter(m.endAt!)) return false;
    return true;
  }

  bool _matchesTrigger(InAppMessage m, IamTriggerContext ctx) {
    final declared = m.trigger.type;
    return switch (ctx) {
      IamTriggerLaunch() => declared == IamTriggerType.onLaunch,
      IamTriggerRoute(:final String path) =>
        declared == IamTriggerType.onRoute &&
            (m.trigger.routePath ?? '').isNotEmpty &&
            path == m.trigger.routePath,
      IamTriggerEvent(:final String name, :final Map<String, dynamic> params) =>
        declared == IamTriggerType.onEvent &&
            (m.trigger.eventName ?? '').isNotEmpty &&
            name == m.trigger.eventName &&
            _paramsMatch(m.trigger.eventParamsMatch, params),
    };
  }

  bool _paramsMatch(
    Map<String, dynamic> required,
    Map<String, dynamic> actual,
  ) {
    if (required.isEmpty) return true;
    for (final entry in required.entries) {
      if (actual[entry.key] != entry.value) return false;
    }
    return true;
  }

  bool _matchesTargeting(InAppMessage m, IamUserContext u) {
    final t = m.targeting;
    if (t.platforms.isNotEmpty && !t.platforms.contains(u.platform)) {
      return false;
    }
    if (t.envs.isNotEmpty && !t.envs.contains(u.env)) return false;
    if (!isVersionInRange(
      u.appVersion,
      min: t.minAppVersion,
      max: t.maxAppVersion,
    )) {
      return false;
    }
    if (t.organizations.isNotEmpty &&
        (u.organizationId == null ||
            !t.organizations.contains(u.organizationId))) {
      return false;
    }
    if (u.organizationId != null &&
        t.excludeOrganizations.contains(u.organizationId)) {
      return false;
    }
    if (t.roles.isNotEmpty && !u.roles.any(t.roles.contains)) return false;
    if (t.allowUserIds.isNotEmpty && !t.allowUserIds.contains(u.userId)) {
      return false;
    }
    if (t.denyUserIds.contains(u.userId)) return false;
    return true;
  }

  bool _passesFrequency(InAppMessage m, IamMessageState state) {
    if (state.dismissed &&
        m.frequency.dismissBehavior == IamDismissBehavior.doNotShowAgain) {
      return false;
    }
    final cap = m.frequency.maxImpressions;
    if (cap != null && state.impressions >= cap) return false;
    return true;
  }

  Future<IamVariantPickResult?> _pickVariant(
    InAppMessage m,
    IamUserContext user,
    IamMessageState state,
  ) async {
    final pick = _variantPicker.pick(
      message: m,
      userId: user.userId,
      state: state,
    );
    if (pick == null) return null;

    // Persist a fresh roll so subsequent ticks stay sticky. A sticky pick
    // already lives in the store, so it is safe to skip the write.
    if (!pick.sticky) {
      await _store.mutate(
        m.id,
        (IamMessageState c) => c.copyWith(stickyVariantIndex: pick.index),
      );
    }
    return pick;
  }
}
