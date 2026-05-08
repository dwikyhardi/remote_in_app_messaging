import 'dart:async';

import 'domain/entities/iam_trigger_context.dart';
import 'domain/iam_host_bindings.dart';
import 'infrastructure/engine/in_app_messaging_coordinator.dart';
import 'infrastructure/engine/in_app_messaging_engine.dart';
import 'infrastructure/state/iam_state_store.dart';

/// Thin host-facing facade over the IAM coordinator. Use [IamService.init] in
/// app bootstrap, then dispatch triggers from the host wiring via
/// [onAppLaunch], [onRoute], and [onEvent].
class IamService {
  /// Initializes the service with host [bindings]. Optional [store] overrides
  /// persistence (defaults to an in-memory store; production hosts should
  /// inject a Hive-backed store).
  ///
  /// Subsequent calls replace the singleton: the previous instance is
  /// disposed first so its coordinator state does not leak into the new one.
  factory IamService.init(
    IamHostBindings bindings, {
    IamStateStore? store,
  }) {
    _instance?.dispose();
    final actualStore = store ?? InMemoryIamStateStore();
    final engine = InAppMessagingEngine(
      stateStore: actualStore,
      logInfo: (String message) => bindings.logInfo(message),
    );
    final coordinator = InAppMessagingCoordinator(
      bindings: bindings,
      engine: engine,
      store: actualStore,
    );
    final service = IamService._(coordinator, actualStore);
    _instance = service;
    return service;
  }
  IamService._(this._coordinator, this._store);

  final InAppMessagingCoordinator _coordinator;
  final IamStateStore _store;

  static IamService? _instance;

  /// Returns the singleton previously created with [IamService.init],
  /// or `null` if the service has not been initialized yet.
  /// Host integration code should treat a `null` return as a no-op.
  static IamService? get instance => _instance;

  /// Fires a launch-trigger tick. Typically called after the user is logged in
  /// and the navigator is ready.
  Future<void> onAppLaunch() =>
      _coordinator.onTrigger(const IamTriggerContext.launch());

  /// Fires a route-trigger tick for the given [path].
  Future<void> onRoute(String path) =>
      _coordinator.onTrigger(IamTriggerContext.route(path));

  /// Fires an event-trigger tick for the given [name] with optional [params].
  Future<void> onEvent(String name, [Map<String, dynamic>? params]) {
    return _coordinator.onTrigger(
      IamTriggerContext.event(
        name,
        params: params ?? const <String, dynamic>{},
      ),
    );
  }

  /// Invalidates the internal parsed-messages cache (e.g., after Remote Config
  /// activation).
  void invalidateCache() => _coordinator.invalidateCache();

  /// Clears all persisted per-message state (impressions, sticky variants,
  /// dismissals). Primarily intended for developer tooling and logout flows,
  /// where callers want in-app messages to re-qualify as if seen for the
  /// first time. Also invalidates the parsed-messages cache.
  Future<void> resetState() async {
    _coordinator.invalidateCache();
    await _store.clear();
  }

  /// Releases the singleton. Useful in tests and on logout.
  void dispose() {
    if (identical(_instance, this)) _instance = null;
  }
}
