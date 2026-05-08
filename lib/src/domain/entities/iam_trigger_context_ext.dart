import 'iam_trigger_context.dart';

/// Analytics-friendly views over [IamTriggerContext].
///
/// Implemented as an extension instead of being baked into the freezed
/// declaration so the generated `*.freezed.dart` file stays untouched.
extension IamTriggerContextAnalytics on IamTriggerContext {
  /// Short stable name describing the trigger family. Mirrors the legacy
  /// `_triggerName` switch previously inlined in the coordinator.
  String get analyticsName => switch (this) {
    IamTriggerLaunch() => 'launch',
    IamTriggerRoute() => 'route',
    IamTriggerEvent() => 'event',
  };

  /// Trigger-specific target string: the route path for `route`, the event
  /// name for `event`, and an empty string for `launch`. Mirrors the legacy
  /// `_triggerTarget` switch previously inlined in the coordinator.
  String get analyticsTarget => switch (this) {
    IamTriggerLaunch() => '',
    IamTriggerRoute(:final String path) => path,
    IamTriggerEvent(:final String name) => name,
  };
}
