import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_in_app_messaging/remote_in_app_messaging.dart';

void main() {
  group('InAppMessagesParser', () {
    const canonical = '''
{
  "version": 1,
  "messages": [
    {
      "id": "promo_new_card_2025",
      "enabled": true,
      "layout": "modal",
      "startAt": "2025-01-01T00:00:00Z",
      "endAt":   "2025-12-31T23:59:59Z",
      "trigger": {
        "type": "on_event",
        "eventName": "card_activated",
        "eventParamsMatch": {"status": "success"},
        "delayMs": 0
      },
      "targeting": {
        "platforms": ["android", "ios"],
        "envs": ["production", "development"],
        "minAppVersion": "1.13.0",
        "maxAppVersion": null,
        "organizations": [],
        "excludeOrganizations": [],
        "roles": [],
        "allowUserIds": [],
        "denyUserIds": []
      },
      "frequency": {"maxImpressions": 3, "dismissBehavior": "do_not_show_again"},
      "variants": [
        {
          "weight": 50,
          "content": {
            "title": "Your new card is ready",
            "body":  "Activate it now.",
            "imageUrl": "https://example.com/iam/card_promo.png",
            "primaryCta":   {"label": "Activate", "action": "deep_link",    "url": "/card"},
            "secondaryCta": {"label": "Later",    "action": "close"}
          }
        }
      ]
    }
  ]
}
''';

    test('canonical JSON round-trips into a single InAppMessage', () {
      const parser = InAppMessagesParser();
      final messages = parser.parse(canonical);

      expect(messages, hasLength(1));
      final m = messages.first;
      expect(m.id, 'promo_new_card_2025');
      expect(m.enabled, true);
      expect(m.layout, IamLayout.modal);
      expect(m.startAt, DateTime.parse('2025-01-01T00:00:00Z'));
      expect(m.endAt, DateTime.parse('2025-12-31T23:59:59Z'));

      expect(m.trigger.type, IamTriggerType.onEvent);
      expect(m.trigger.eventName, 'card_activated');
      expect(m.trigger.eventParamsMatch, {'status': 'success'});

      expect(m.targeting.platforms, ['android', 'ios']);
      expect(m.targeting.envs, ['production', 'development']);
      expect(m.targeting.minAppVersion, '1.13.0');
      expect(m.targeting.maxAppVersion, isNull);

      expect(m.frequency.maxImpressions, 3);
      expect(m.frequency.dismissBehavior, IamDismissBehavior.doNotShowAgain);

      expect(m.variants, hasLength(1));
      final v = m.variants.single;
      expect(v.weight, 50);
      expect(v.content.title, 'Your new card is ready');
      expect(v.content.imageUrl, 'https://example.com/iam/card_promo.png');
      expect(v.content.primaryCta?.action, IamActionType.deepLink);
      expect(v.content.primaryCta?.url, '/card');
      expect(v.content.secondaryCta?.action, IamActionType.close);
    });

    test('unknown top-level and per-entry fields are ignored', () {
      final src = jsonEncode({
        'version': 1,
        'extraTop': 'ignore-me',
        'messages': [
          {
            'id': 'with_extras',
            'somethingNew': true,
            'layout': 'bottom_sheet',
            'trigger': {'type': 'on_launch', 'future_field': 42},
          },
        ],
      });

      const parser = InAppMessagesParser();
      final messages = parser.parse(src);

      expect(messages, hasLength(1));
      expect(messages.single.id, 'with_extras');
      expect(messages.single.layout, IamLayout.bottomSheet);
      expect(messages.single.trigger.type, IamTriggerType.onLaunch);
    });

    test('layout "image_only_modal" parses to IamLayout.imageOnlyModal', () {
      final src = jsonEncode({
        'messages': [
          {
            'id': 'promo_image_only',
            'layout': 'image_only_modal',
            'trigger': {'type': 'on_event', 'eventName': 'show_image_modal'},
            'variants': [
              {
                'weight': 100,
                'content': {'imageUrl': 'assets/parrot.jpg'},
              },
            ],
          },
        ],
      });

      const parser = InAppMessagesParser();
      final messages = parser.parse(src);

      expect(messages, hasLength(1));
      expect(messages.single.layout, IamLayout.imageOnlyModal);
    });

    test('missing variants defaults to empty list (campaign loads)', () {
      final src = jsonEncode({
        'messages': [
          {
            'id': 'no_variants',
            'trigger': {'type': 'on_launch'},
          },
        ],
      });

      const parser = InAppMessagesParser();
      final messages = parser.parse(src);

      expect(messages, hasLength(1));
      expect(messages.single.variants, isEmpty);
    });

    test('malformed entry is skipped, others still load, logError called', () {
      final errors = <String>[];
      final parser = InAppMessagesParser(
        logError: (e, [st, ctx]) => errors.add('${ctx ?? ''}: $e'),
      );

      final src = jsonEncode({
        'messages': [
          'not-a-map',
          {
            'id': '',
            'trigger': {'type': 'on_launch'},
          }, // empty id → skip
          {
            'id': 'ok_1',
            'trigger': {'type': 'on_launch'},
          },
          {'id': 'bad_enum', 'layout': 'not-a-real-layout'},
          {
            'id': 'ok_2',
            'trigger': {'type': 'on_route', 'routePath': '/x'},
          },
        ],
      });

      final messages = parser.parse(src);

      expect(messages.map((m) => m.id), ['ok_1', 'ok_2']);
      expect(errors, isNotEmpty);
    });

    test('empty / null / invalid JSON returns empty list', () {
      const parser = InAppMessagesParser();
      expect(parser.parse(null), isEmpty);
      expect(parser.parse(''), isEmpty);
      expect(parser.parse('   '), isEmpty);
      expect(parser.parse('not a json'), isEmpty);
    });

    test('payload without "messages" key returns empty list', () {
      const parser = InAppMessagesParser();
      expect(parser.parse('{"version": 1}'), isEmpty);
    });

    test('bare list of messages is accepted via parseMap', () {
      const parser = InAppMessagesParser();
      final list = parser.parseMap([
        {
          'id': 'a',
          'trigger': {'type': 'on_launch'},
        },
        {
          'id': 'b',
          'trigger': {'type': 'on_launch'},
        },
      ]);
      expect(list.map((m) => m.id), ['a', 'b']);
    });
  });
}
