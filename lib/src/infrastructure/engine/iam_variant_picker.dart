import '../../domain/entities/iam_message_state.dart';
import '../../domain/entities/iam_variant.dart';
import '../../domain/entities/in_app_message.dart';

/// Helper extension that clamps negative weights to `0`. Centralized so the
/// picker, future debug tooling, and tests share one definition.
extension IamVariantWeightExt on IamVariant {
  /// Effective weight used for variant selection. Negative or zero weights
  /// drop the variant from the bucket distribution.
  int get normalizedWeight => weight > 0 ? weight : 0;
}

/// Pure variant selection logic, lifted out of `InAppMessagingEngine`.
///
/// Determinism contract:
/// - If the message already has a sticky variant in [IamMessageState], return
///   that index unchanged.
/// - Otherwise compute a stable bucket from `userId|messageId` and pick the
///   first variant whose cumulative weight covers the bucket.
///
/// Returns `null` when there is nothing to pick (no variants, or all weights
/// are zero).
class IamVariantPicker {
  const IamVariantPicker();

  IamVariantPickResult? pick({
    required InAppMessage message,
    required String userId,
    required IamMessageState state,
  }) {
    if (message.variants.isEmpty) return null;

    final sticky = state.stickyVariantIndex;
    if (sticky != null && sticky >= 0 && sticky < message.variants.length) {
      return IamVariantPickResult(index: sticky, sticky: true);
    }

    final totalWeight = message.variants.fold<int>(
      0,
      (int sum, IamVariant v) => sum + v.normalizedWeight,
    );
    if (totalWeight <= 0) return null;

    final bucket = (_stableHash('$userId|${message.id}') % totalWeight).abs();
    var acc = 0;
    var chosen = 0;
    for (var i = 0; i < message.variants.length; i++) {
      acc += message.variants[i].normalizedWeight;
      if (bucket < acc) {
        chosen = i;
        break;
      }
    }
    return IamVariantPickResult(index: chosen, sticky: false);
  }

  /// Stable FNV-1a 32-bit hash — deterministic across platforms and sessions.
  int _stableHash(String input) {
    const fnvOffset = 0x811C9DC5;
    const fnvPrime = 0x01000193;
    var hash = fnvOffset;
    for (final codeUnit in input.codeUnits) {
      hash = (hash ^ codeUnit) & 0xFFFFFFFF;
      hash = (hash * fnvPrime) & 0xFFFFFFFF;
    }
    return hash;
  }
}

/// Result of [IamVariantPicker.pick]: the chosen index plus a flag that tells
/// the engine whether the pick came from sticky persistence (no need to
/// re-write the store) or from a fresh roll (must persist).
class IamVariantPickResult {
  const IamVariantPickResult({required this.index, required this.sticky});

  final int index;
  final bool sticky;
}
