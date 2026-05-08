import 'package:flutter_test/flutter_test.dart';
import 'package:remote_in_app_messaging/remote_in_app_messaging.dart';

InAppMessage _baseMessage({
  String id = 'm1',
  IamTriggerType triggerType = IamTriggerType.onLaunch,
  String? routePath,
  String? eventName,
  Map<String, dynamic> eventParamsMatch = const <String, dynamic>{},
  IamTargeting targeting = const IamTargeting(),
  IamFrequency frequency = const IamFrequency(),
  List<IamVariant> variants = const <IamVariant>[
    IamVariant(content: IamContent(title: 'A')),
  ],
  DateTime? startAt,
  DateTime? endAt,
  bool enabled = true,
  IamLayout layout = IamLayout.modal,
}) {
  return InAppMessage(
    id: id,
    enabled: enabled,
    layout: layout,
    startAt: startAt,
    endAt: endAt,
    trigger: IamTrigger(
      type: triggerType,
      routePath: routePath,
      eventName: eventName,
      eventParamsMatch: eventParamsMatch,
    ),
    targeting: targeting,
    frequency: frequency,
    variants: variants,
  );
}

const IamUserContext _androidProdUser = IamUserContext(
  userId: 'u1',
  platform: 'android',
  env: 'production',
  appVersion: '1.13.0',
  organizationId: 'orgA',
  roles: <String>['member'],
);

void main() {
  group('InAppMessagingEngine - gates', () {
    test('global disabled → null', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[_baseMessage()],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: false,
      );
      expect(res, isNull);
    });

    test('message.enabled=false → skipped', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[_baseMessage(enabled: false)],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });

    test('schedule: before startAt → skipped', () async {
      final engine = InAppMessagingEngine(
        stateStore: InMemoryIamStateStore(),
        now: () => DateTime.utc(2024, 12, 31),
      );
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(startAt: DateTime.utc(2025)),
        ],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });

    test('schedule: after endAt → skipped', () async {
      final engine = InAppMessagingEngine(
        stateStore: InMemoryIamStateStore(),
        now: () => DateTime.utc(2026, 1, 2),
      );
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(endAt: DateTime.utc(2026)),
        ],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });
  });

  group('InAppMessagingEngine - triggers', () {
    test('route path matches', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(triggerType: IamTriggerType.onRoute, routePath: '/home'),
        ],
        triggerCtx: const IamTriggerContext.route('/home'),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNotNull);
    });

    test('route path mismatch → null', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(triggerType: IamTriggerType.onRoute, routePath: '/home'),
        ],
        triggerCtx: const IamTriggerContext.route('/other'),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });

    test('event name + params match', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(
            triggerType: IamTriggerType.onEvent,
            eventName: 'card_activated',
            eventParamsMatch: const <String, dynamic>{'status': 'success'},
          ),
        ],
        triggerCtx: const IamTriggerContext.event(
          'card_activated',
          params: <String, dynamic>{'status': 'success', 'extra': 1},
        ),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNotNull);
    });

    test('event params mismatch → null', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(
            triggerType: IamTriggerType.onEvent,
            eventName: 'card_activated',
            eventParamsMatch: const <String, dynamic>{'status': 'success'},
          ),
        ],
        triggerCtx: const IamTriggerContext.event(
          'card_activated',
          params: <String, dynamic>{'status': 'failure'},
        ),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });
  });

  group('InAppMessagingEngine - targeting', () {
    test('platform mismatch', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(
            targeting: const IamTargeting(platforms: <String>['ios']),
          ),
        ],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });

    test('app version below minAppVersion', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(
            targeting: const IamTargeting(minAppVersion: '2.0.0'),
          ),
        ],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });

    test('organization allow-list excludes user', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(
            targeting: const IamTargeting(organizations: <String>['orgB']),
          ),
        ],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });

    test('denyUserIds blocks match', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(
            targeting: const IamTargeting(denyUserIds: <String>['u1']),
          ),
        ],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });

    test('role overlap passes', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(
            targeting: const IamTargeting(roles: <String>['admin', 'member']),
          ),
        ],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNotNull);
    });
  });

  group('InAppMessagingEngine - frequency', () {
    test('maxImpressions cap', () async {
      final store = InMemoryIamStateStore();
      await store.write(
        'm1',
        const IamMessageState(impressions: 3),
      );
      final engine = InAppMessagingEngine(stateStore: store);
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(frequency: const IamFrequency(maxImpressions: 3)),
        ],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });

    test('dismissed + doNotShowAgain → skipped', () async {
      final store = InMemoryIamStateStore();
      await store.write('m1', const IamMessageState(dismissed: true));
      final engine = InAppMessagingEngine(stateStore: store);
      final res = await engine.evaluate(
        messages: <InAppMessage>[_baseMessage()],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });

    test('dismissed + allowRetry → still eligible', () async {
      final store = InMemoryIamStateStore();
      await store.write('m1', const IamMessageState(dismissed: true));
      final engine = InAppMessagingEngine(stateStore: store);
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(
            frequency: const IamFrequency(
              dismissBehavior: IamDismissBehavior.allowRetry,
            ),
          ),
        ],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNotNull);
    });
  });

  group('InAppMessagingEngine - variants', () {
    test('total weight zero → ineligible', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(
            variants: const <IamVariant>[
              IamVariant(weight: 0, content: IamContent(title: 'A')),
              IamVariant(weight: 0, content: IamContent(title: 'B')),
            ],
          ),
        ],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });

    test('empty variants → ineligible', () async {
      final engine = InAppMessagingEngine(stateStore: InMemoryIamStateStore());
      final res = await engine.evaluate(
        messages: <InAppMessage>[
          _baseMessage(variants: const <IamVariant>[]),
        ],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(res, isNull);
    });

    test('variant choice is sticky across evaluations', () async {
      final store = InMemoryIamStateStore();
      final engine = InAppMessagingEngine(stateStore: store);
      final msg = _baseMessage(
        variants: const <IamVariant>[
          IamVariant(weight: 50, content: IamContent(title: 'A')),
          IamVariant(weight: 50, content: IamContent(title: 'B')),
        ],
      );
      final r1 = await engine.evaluate(
        messages: <InAppMessage>[msg],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      final r2 = await engine.evaluate(
        messages: <InAppMessage>[msg],
        triggerCtx: const IamTriggerContext.launch(),
        user: _androidProdUser,
        globallyEnabled: true,
      );
      expect(r1, isNotNull);
      expect(r2, isNotNull);
      expect(r1!.variantIndex, equals(r2!.variantIndex));
      expect(store.read('m1')?.stickyVariantIndex, equals(r1.variantIndex));
    });
  });
}
