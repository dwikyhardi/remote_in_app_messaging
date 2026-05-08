# Public API

## `IamService`

```dart
// Bootstrap (once, at app start).
IamService.init(bindings, store: HiveIamStateStore(...));

// Triggers.
IamService.instance?.onAppLaunch();
IamService.instance?.onRoute('/home');
IamService.instance?.onEvent('card_activated', {'status': 'success'});

// Cache & state.
IamService.instance?.invalidateCache();   // after Remote Config activation
await IamService.instance?.resetState();  // on logout / dev tooling
IamService.instance?.dispose();           // tests / logout
```

## `IamHostBindings`

The full contract the **host** must implement:

```dart
abstract class IamHostBindings {
  Future<String> loadMessagesJson();
  bool isEnabled();
  IamUserContext currentUser();
  GlobalKey<NavigatorState> get navigatorKey;

  void trackEvent(String name, Map<String, dynamic> params);
  Future<bool> openDeepLink(String url);
  Future<bool> openExternalUrl(String url);

  void logInfo(String message, {Map<String, Object?>? data});
  void logError(Object error, [StackTrace? stackTrace, String? context]);
}
```

See [Quick start](quick-start.md) for a worked implementation example.
