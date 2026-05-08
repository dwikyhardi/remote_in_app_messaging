import 'package:flutter_test/flutter_test.dart';
import 'package:remote_in_app_messaging/remote_in_app_messaging.dart';

InAppMessage _msg(List<IamVariant> variants) => InAppMessage(
  id: 'm',
  variants: variants,
);

void main() {
  group('IamVariantPicker', () {
    const picker = IamVariantPicker();

    test('returns null on empty variants', () {
      final res = picker.pick(
        message: _msg(<IamVariant>[]),
        userId: 'u',
        state: const IamMessageState(),
      );
      expect(res, isNull);
    });

    test('returns sticky index when state holds one in range', () {
      final res = picker.pick(
        message: _msg(<IamVariant>[
          const IamVariant(weight: 10),
          const IamVariant(weight: 20),
        ]),
        userId: 'u',
        state: const IamMessageState(stickyVariantIndex: 1),
      );
      expect(res, isNotNull);
      expect(res!.index, 1);
      expect(res.sticky, true);
    });

    test('falls through when sticky index is out of range', () {
      final res = picker.pick(
        message: _msg(<IamVariant>[const IamVariant()]),
        userId: 'u',
        state: const IamMessageState(stickyVariantIndex: 99),
      );
      expect(res, isNotNull);
      expect(res!.sticky, false);
      expect(res.index, 0);
    });

    test('zero/negative total weight returns null', () {
      final res = picker.pick(
        message: _msg(<IamVariant>[
          const IamVariant(weight: 0),
          const IamVariant(weight: -5),
        ]),
        userId: 'u',
        state: const IamMessageState(),
      );
      expect(res, isNull);
    });

    test('picks a variant within the cumulative weight bucket', () {
      final res = picker.pick(
        message: _msg(<IamVariant>[
          const IamVariant(),
          const IamVariant(weight: 99),
        ]),
        userId: 'u',
        state: const IamMessageState(),
      );
      expect(res, isNotNull);
      expect(res!.sticky, false);
      expect(res.index, inInclusiveRange(0, 1));
    });

    test('hash is deterministic across picks for the same key pair', () {
      final m = _msg(<IamVariant>[
        const IamVariant(),
        const IamVariant(),
        const IamVariant(),
      ]);
      final a = picker.pick(
        message: m,
        userId: 'user-42',
        state: const IamMessageState(),
      )!;
      final b = picker.pick(
        message: m,
        userId: 'user-42',
        state: const IamMessageState(),
      )!;
      expect(a.index, b.index);
    });
  });

  group('IamVariantWeightExt.normalizedWeight', () {
    test('clamps negative + zero', () {
      expect(const IamVariant(weight: -1).normalizedWeight, 0);
      expect(const IamVariant(weight: 0).normalizedWeight, 0);
      expect(const IamVariant(weight: 5).normalizedWeight, 5);
    });
  });
}
