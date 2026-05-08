import 'iam_cta.dart';
import 'iam_style.dart';

/// Convenience extensions on the freezed [IamCta] model.
///
/// Co-located in `domain/` because they are pure-Dart helpers; they do not
/// import any Flutter widget code.
extension IamCtaFallbackStyleExt on IamCta {
  /// Returns a copy of this CTA whose [IamCta.style] falls back to [fallback]
  /// when the per-CTA style was not provided in the JSON payload.
  ///
  /// Style precedence stays:
  ///   per-CTA JSON `style` > body-level fallback > built-in default.
  IamCta withFallbackStyle(IamCtaButtonStyle? fallback) {
    if (style != null || fallback == null) return this;
    return copyWith(style: fallback);
  }
}
