import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remote_in_app_messaging/remote_in_app_messaging.dart';

class _StubBindings implements IamHostBindings {
  _StubBindings();

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  IamUserContext currentUser() => const IamUserContext(
    userId: 'u1',
    platform: 'android',
    env: 'production',
    appVersion: '1.0.0',
  );

  @override
  bool isEnabled() => true;

  @override
  Future<String> loadMessagesJson() async => '{}';

  @override
  void logError(Object error, [StackTrace? stackTrace, String? context]) {}

  @override
  void logInfo(String message, {Map<String, Object?>? data}) {}

  @override
  Future<bool> openDeepLink(String url) async => true;

  @override
  Future<bool> openExternalUrl(String url) async => true;

  @override
  void trackEvent(String name, Map<String, dynamic> params) {}
}

void main() {
  test('IamService.init replaces and disposes prior singleton', () {
    final first = IamService.init(_StubBindings());
    expect(IamService.instance, same(first));

    final second = IamService.init(_StubBindings());
    expect(IamService.instance, same(second));
    expect(IamService.instance, isNot(same(first)));

    second.dispose();
    expect(IamService.instance, isNull);
  });
}
