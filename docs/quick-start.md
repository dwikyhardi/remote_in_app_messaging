# Quick start (5 minutes)

Wire `remote_in_app_messaging` into your app in three steps.

## 1. Implement `IamHostBindings`

This is your single integration point. Plug in your remote config, analytics,
logging, navigation and URL-opening code.

```dart
class MyIamHostBindings extends IamHostBindings {
  MyIamHostBindings(this.remoteConfig, this.analytics, this.navigatorKey);

  final FirebaseRemoteConfig remoteConfig;
  final MyAnalytics analytics;
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Future<String> loadMessagesJson() async =>
      remoteConfig.getString('in_app_messages');

  @override
  bool isEnabled() => remoteConfig.getBool('iam_enabled');

  @override
  IamUserContext currentUser() => IamUserContext(
        userId: session.userId,
        platform: Platform.isIOS ? 'ios' : 'android',
        env: kReleaseMode ? 'production' : 'development',
        appVersion: packageInfo.version,
        // organizations / roles if you use them…
      );

  @override
  void trackEvent(String name, Map<String, dynamic> params) =>
      analytics.logEvent(name: name, parameters: params);

  @override
  Future<bool> openDeepLink(String url)    => router.push(url);
  @override
  Future<bool> openExternalUrl(String url) => launchUrlString(url);

  @override
  void logInfo(String msg, {Map<String, Object?>? data}) => log.i(msg, data);
  @override
  void logError(Object e, [StackTrace? s, String? ctx]) => log.e(e, s, ctx);
}
```

## 2. Initialize the service

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final navKey = GlobalKey<NavigatorState>();

  IamService.init(
    MyIamHostBindings(remoteConfig, analytics, navKey),
    // Optional: inject a Hive-backed store for production persistence.
    // store: HiveIamStateStore(...),
  );

  runApp(MyApp(navigatorKey: navKey));
}
```

## 3. Wire the triggers

```dart
// After login / app ready:
await IamService.instance?.onAppLaunch();

// In a NavigatorObserver:
class IamRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? prev) {
    final name = route.settings.name;
    if (name != null) IamService.instance?.onRoute(name);
  }
}

// In your analytics/tracking layer:
void track(String name, Map<String, dynamic> params) {
  analytics.logEvent(name: name, parameters: params);
  IamService.instance?.onEvent(name, params);
}

// After a Remote Config activation:
IamService.instance?.invalidateCache();
```

That's it — messages now flow from Remote Config to the user.

## Next steps

- [Triggers](triggers.md) — how launch / route / event hooks behave.
- [JSON schema](json-schema.md) — payload format and supported layouts.
- [Targeting, frequency & schedule](targeting-and-frequency.md) —
  audience and rate-limit controls + CTA actions.
- [Styling via JSON](styling.md) — full visual customization from the
  remote payload.
- [Public API](api.md) — `IamService` and the full `IamHostBindings`
  contract.
