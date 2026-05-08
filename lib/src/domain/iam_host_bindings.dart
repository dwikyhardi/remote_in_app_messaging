import 'package:flutter/widgets.dart';

import 'entities/iam_user_context.dart';

/// Host-supplied integration contract.
///
/// The `remote_in_app_messaging` package is host-agnostic: all I/O and
/// side-effects (loading the JSON payload, reading the current user, tracking
/// events, opening URLs, logging) are provided by the host through this
/// interface. Any host — production app, tests, or sample apps — satisfies
/// the package by implementing these methods.
abstract class IamHostBindings {
  const IamHostBindings();

  /// Returns the raw JSON payload for the IAM campaign list.
  ///
  /// Typical implementation reads
  /// `FirebaseRemoteConfig.getString('in_app_messages')`.
  /// Implementations must never throw — return an empty JSON object on error
  /// and log through [logError].
  Future<String> loadMessagesJson();

  /// Global kill-switch. When `false`, the engine skips all evaluation.
  bool isEnabled();

  /// Current user + device/app context used for targeting evaluation.
  IamUserContext currentUser();

  /// Root navigator key used by renderers to show dialogs / bottom sheets /
  /// fullscreen routes without requiring a `BuildContext` at call sites.
  GlobalKey<NavigatorState> get navigatorKey;

  /// Forwards an analytics event (e.g., `iam_message_shown`,
  /// `iam_cta_clicked`, `iam_dismissed`) to the host's tracking pipeline.
  void trackEvent(String name, Map<String, dynamic> params);

  /// Navigates to an in-app deep link (e.g., `/card`). Returns `true` on
  /// success; `false` triggers an `iam_cta_invalid_path` event.
  Future<bool> openDeepLink(String url);

  /// Opens an external URL via the platform browser. Returns `true` on
  /// success.
  Future<bool> openExternalUrl(String url);

  /// Structured info-level logging hook (e.g., `Logger.info`).
  void logInfo(String message, {Map<String, Object?>? data});

  /// Structured error-level logging hook (e.g., `Logger.error`).
  void logError(Object error, [StackTrace? stackTrace, String? context]);
}
