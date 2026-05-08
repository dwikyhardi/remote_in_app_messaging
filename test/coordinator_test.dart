import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remote_in_app_messaging/remote_in_app_messaging.dart';

class _FakeBindings implements IamHostBindings {
  _FakeBindings({
    required this.json,
    this.enabled = true,
    IamUserContext? user,
    GlobalKey<NavigatorState>? key,
  }) : _user =
           user ??
           const IamUserContext(
             userId: 'u1',
             platform: 'android',
             env: 'production',
             appVersion: '1.0.0',
           ),
       navigatorKey = key ?? GlobalKey<NavigatorState>();

  final String json;
  final bool enabled;
  final IamUserContext _user;

  final List<MapEntry<String, Map<String, dynamic>>> trackedEvents =
      <MapEntry<String, Map<String, dynamic>>>[];
  final List<String> deepLinks = <String>[];
  final List<String> externalUrls = <String>[];
  bool deepLinkResult = true;
  bool externalUrlResult = true;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  IamUserContext currentUser() => _user;

  @override
  bool isEnabled() => enabled;

  @override
  Future<String> loadMessagesJson() async => json;

  @override
  void logError(Object error, [StackTrace? stackTrace, String? context]) {}

  @override
  void logInfo(String message, {Map<String, Object?>? data}) {}

  @override
  Future<bool> openDeepLink(String url) async {
    deepLinks.add(url);
    return deepLinkResult;
  }

  @override
  Future<bool> openExternalUrl(String url) async {
    externalUrls.add(url);
    return externalUrlResult;
  }

  @override
  void trackEvent(String name, Map<String, dynamic> params) {
    trackedEvents.add(MapEntry<String, Map<String, dynamic>>(name, params));
  }
}

class _RecordingRenderer implements IamRenderer {
  _RecordingRenderer(this.result);

  final IamRenderResult result;
  int calls = 0;

  @override
  Future<IamRenderResult> show({
    required BuildContext context,
    required IamContent content,
    bool showCloseButton = true,
  }) async {
    calls += 1;
    return result;
  }
}

const String _jsonOneMessage = '''
{
  "messages": [
    {
      "id": "m1",
      "layout": "modal",
      "trigger": {"type": "on_launch"},
      "variants": [
        {
          "weight": 1,
          "content": {
            "title": "Hi",
            "body":  "Welcome",
            "primaryCta":   {"label": "Go", "action": "deep_link", "url": "/home"},
            "secondaryCta": {"label": "No", "action": "close"}
          }
        }
      ]
    }
  ]
}
''';

InAppMessagingCoordinator _buildCoordinator(
  _FakeBindings bindings,
  _RecordingRenderer renderer, {
  IamStateStore? store,
}) {
  final s = store ?? InMemoryIamStateStore();
  return InAppMessagingCoordinator(
    bindings: bindings,
    engine: InAppMessagingEngine(stateStore: s),
    store: s,
    renderers: <IamLayout, IamRenderer>{
      IamLayout.modal: renderer,
      IamLayout.bottomSheet: renderer,
      IamLayout.fullscreen: renderer,
    },
  );
}

Future<BuildContext> _mountNavigator(
  WidgetTester tester,
  GlobalKey<NavigatorState> key,
) async {
  await tester.pumpWidget(
    WidgetsApp(
      navigatorKey: key,
      color: const Color(0xFF000000),
      onGenerateRoute: (_) => PageRouteBuilder<void>(
        pageBuilder: (_, _, _) => const SizedBox.shrink(),
      ),
    ),
  );
  return key.currentContext!;
}

void main() {
  testWidgets(
    'onTrigger → render → impression + shown analytics + deep link CTA',
    (WidgetTester tester) async {
      final bindings = _FakeBindings(json: _jsonOneMessage);
      await _mountNavigator(tester, bindings.navigatorKey);

      const primary = IamCta(
        label: 'Go',
        action: IamActionType.deepLink,
        url: '/home',
      );
      final renderer = _RecordingRenderer(
        const IamRenderResult.cta(primary),
      );
      final IamStateStore store = InMemoryIamStateStore();
      final coord = _buildCoordinator(
        bindings,
        renderer,
        store: store,
      );

      await coord.onTrigger(const IamTriggerContext.launch());

      expect(renderer.calls, 1);
      expect(bindings.deepLinks, <String>['/home']);

      final events = bindings.trackedEvents
          .map((MapEntry<String, Map<String, dynamic>> e) => e.key)
          .toList();
      expect(events, <String>['iam_message_shown', 'iam_cta_clicked']);

      final state = store.read('m1');
      expect(state, isNotNull);
      expect(state!.impressions, 1);
      expect(state.ctaClicked, true);
      expect(state.stickyVariantIndex, 0);
    },
  );

  testWidgets('dismiss records dismissed flag + iam_dismissed event', (
    WidgetTester tester,
  ) async {
    final bindings = _FakeBindings(json: _jsonOneMessage);
    await _mountNavigator(tester, bindings.navigatorKey);

    final renderer = _RecordingRenderer(
      const IamRenderResult.dismissed(),
    );
    final IamStateStore store = InMemoryIamStateStore();
    final coord = _buildCoordinator(
      bindings,
      renderer,
      store: store,
    );

    await coord.onTrigger(const IamTriggerContext.launch());

    expect(store.read('m1')!.dismissed, true);
    expect(
      bindings.trackedEvents
          .map((MapEntry<String, Map<String, dynamic>> e) => e.key)
          .toList(),
      <String>['iam_message_shown', 'iam_dismissed'],
    );
  });

  testWidgets('no-op when globally disabled', (WidgetTester tester) async {
    final bindings = _FakeBindings(
      json: _jsonOneMessage,
      enabled: false,
    );
    await _mountNavigator(tester, bindings.navigatorKey);

    final renderer = _RecordingRenderer(
      const IamRenderResult.dismissed(),
    );
    final coord = _buildCoordinator(
      bindings,
      renderer,
    );

    await coord.onTrigger(const IamTriggerContext.launch());

    expect(renderer.calls, 0);
    expect(bindings.trackedEvents, isEmpty);
  });

  testWidgets('invalid deep link path tracks iam_cta_invalid_path', (
    WidgetTester tester,
  ) async {
    final bindings = _FakeBindings(json: _jsonOneMessage)
      ..deepLinkResult = false;
    await _mountNavigator(tester, bindings.navigatorKey);

    final renderer = _RecordingRenderer(
      const IamRenderResult.cta(
        IamCta(label: 'Go', action: IamActionType.deepLink, url: '/bad'),
      ),
    );
    final coord = _buildCoordinator(
      bindings,
      renderer,
    );

    await coord.onTrigger(const IamTriggerContext.launch());

    final events = bindings.trackedEvents
        .map((MapEntry<String, Map<String, dynamic>> e) => e.key)
        .toList();
    expect(events.contains('iam_cta_invalid_path'), true);
  });

  testWidgets('null/empty deepLink url emits iam_cta_invalid_path', (
    WidgetTester tester,
  ) async {
    final bindings = _FakeBindings(json: _jsonOneMessage);
    await _mountNavigator(tester, bindings.navigatorKey);

    final renderer = _RecordingRenderer(
      const IamRenderResult.cta(
        IamCta(label: 'Go', action: IamActionType.deepLink, url: ''),
      ),
    );
    final coord = _buildCoordinator(bindings, renderer);

    await coord.onTrigger(const IamTriggerContext.launch());

    expect(bindings.deepLinks, isEmpty);
    expect(
      bindings.trackedEvents
          .map((MapEntry<String, Map<String, dynamic>> e) => e.key)
          .contains('iam_cta_invalid_path'),
      true,
    );
  });

  testWidgets('null/empty externalUrl emits iam_cta_invalid_path', (
    WidgetTester tester,
  ) async {
    final bindings = _FakeBindings(json: _jsonOneMessage);
    await _mountNavigator(tester, bindings.navigatorKey);

    final renderer = _RecordingRenderer(
      const IamRenderResult.cta(
        IamCta(label: 'Go', action: IamActionType.externalUrl),
      ),
    );
    final coord = _buildCoordinator(bindings, renderer);

    await coord.onTrigger(const IamTriggerContext.launch());

    expect(bindings.externalUrls, isEmpty);
    expect(
      bindings.trackedEvents
          .map((MapEntry<String, Map<String, dynamic>> e) => e.key)
          .contains('iam_cta_invalid_path'),
      true,
    );
  });

  testWidgets('failed external URL emits iam_cta_invalid_path', (
    WidgetTester tester,
  ) async {
    final bindings = _FakeBindings(json: _jsonOneMessage)
      ..externalUrlResult = false;
    await _mountNavigator(tester, bindings.navigatorKey);

    final renderer = _RecordingRenderer(
      const IamRenderResult.cta(
        IamCta(
          label: 'Open',
          action: IamActionType.externalUrl,
          url: 'https://example.com',
        ),
      ),
    );
    final coord = _buildCoordinator(bindings, renderer);

    await coord.onTrigger(const IamTriggerContext.launch());

    expect(bindings.externalUrls, <String>['https://example.com']);
    expect(
      bindings.trackedEvents
          .map((MapEntry<String, Map<String, dynamic>> e) => e.key)
          .contains('iam_cta_invalid_path'),
      true,
    );
  });

  testWidgets(
    'concurrent onTrigger calls invoke loadMessagesJson at most once',
    (WidgetTester tester) async {
      final bindings = _CountingBindings(json: _jsonOneMessage);
      await _mountNavigator(tester, bindings.navigatorKey);

      final renderer = _RecordingRenderer(
        const IamRenderResult.dismissed(),
      );
      final coord = _buildCoordinator(bindings, renderer);

      // Hold the host's `loadMessagesJson` open until both triggers have been
      // queued so the second call must hit the in-flight de-dup path inside
      // [IamMessageRepository] instead of getting a freshly-cached value.
      final f1 = coord.onTrigger(const IamTriggerContext.launch());
      final f2 = coord.onTrigger(const IamTriggerContext.launch());
      bindings.release();
      await tester.pumpAndSettle();
      await Future.wait<void>(<Future<void>>[f1, f2]);

      expect(bindings.loadCalls, 1);
    },
  );
}

class _CountingBindings extends _FakeBindings {
  _CountingBindings({required super.json});

  int loadCalls = 0;
  final Completer<void> _gate = Completer<void>();

  void release() => _gate.complete();

  @override
  Future<String> loadMessagesJson() async {
    loadCalls += 1;
    await _gate.future;
    return json;
  }
}
