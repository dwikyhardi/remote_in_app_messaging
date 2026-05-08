import 'dart:async';

import '../../domain/entities/iam_cta.dart';
import '../../domain/entities/iam_enums.dart';
import '../../domain/iam_host_bindings.dart';

/// Outcome of a CTA dispatch.
///
/// The coordinator forwards [invalidPath] back to analytics as
/// `iam_cta_invalid_path`; everything else is `success`.
enum IamCtaResult { success, invalidPath }

/// Parameters threaded through every action handler.
class IamCtaActionParams {
  const IamCtaActionParams({required this.cta});

  final IamCta cta;
}

typedef _ActionHandler =
    Future<IamCtaResult> Function(IamCtaActionParams params);

/// Translates a tapped [IamCta] into a side effect on the host (open deep
/// link, open external URL, or no-op for `close`).
///
/// Implementation is table-driven via an action map, replacing the previous
/// `switch (action)` block in the coordinator. New action types only need a
/// new entry in [_handlers] (OCP-friendly).
class IamCtaDispatcher {
  IamCtaDispatcher({required IamHostBindings bindings}) : _bindings = bindings {
    _handlers = <IamActionType, _ActionHandler>{
      IamActionType.close: (_) async => IamCtaResult.success,
      IamActionType.deepLink: (params) =>
          _dispatchUrlAction(_bindings.openDeepLink, params),
      IamActionType.externalUrl: (params) =>
          _dispatchUrlAction(_bindings.openExternalUrl, params),
    };
  }

  final IamHostBindings _bindings;
  late final Map<IamActionType, _ActionHandler> _handlers;

  /// Dispatches `params.cta`. Falls back to [IamCtaResult.success] when an
  /// unknown action type is encountered (forward-compat with future schema
  /// additions).
  Future<IamCtaResult> dispatch(IamCtaActionParams params) async {
    final handler = _handlers[params.cta.action];
    if (handler == null) return IamCtaResult.success;
    return handler(params);
  }

  Future<IamCtaResult> _dispatchUrlAction(
    Future<bool> Function(String) opener,
    IamCtaActionParams params,
  ) async {
    final url = params.cta.url;
    if (url == null || url.isEmpty) return IamCtaResult.invalidPath;
    final ok = await opener(url);
    return ok ? IamCtaResult.success : IamCtaResult.invalidPath;
  }
}
