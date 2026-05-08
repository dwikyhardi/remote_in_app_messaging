import 'package:flutter/material.dart';

import '../../domain/entities/iam_content.dart';
import '../../domain/entities/iam_cta.dart';
import '../../domain/entities/iam_style.dart';
import 'iam_style_ext.dart';
import 'iam_style_resolver.dart';

/// Where to place an icon relative to its label inside [IamCtaButton].
enum IamCtaIconAlignment { start, end }

/// Shared CTA button used by all IAM renderers.
///
/// By default it applies the per-campaign [IamContent.backgroundColor] /
/// [IamContent.textColor] overrides when provided; otherwise falls back to the
/// ambient theme.
///
/// All styling parameters below are optional and take precedence over the
/// per-campaign color overrides, allowing full visual customization without
/// changing the JSON payload.
class IamCtaButton extends StatelessWidget {
  const IamCtaButton({
    super.key,
    required this.cta,
    required this.onPressed,
    required this.isPrimary,
    this.content,
    // --- Style overrides ----------------------------------------------------
    this.primaryStyle,
    this.secondaryStyle,
    this.textStyle,
    this.padding,
    this.minimumSize,
    this.borderRadius,
    this.border,
    this.elevation,
    this.backgroundColor,
    this.foregroundColor,
    this.overlayColor,
    // --- Content -----------------------------------------------------------
    this.icon,
    this.iconAlignment,
    this.labelBuilder,
    this.isLoading = false,
    this.loadingIndicator,
    this.enabled,
  });

  final IamCta cta;
  final VoidCallback onPressed;
  final bool isPrimary;
  final IamContent? content;

  /// Explicit [ButtonStyle] for the primary variant. When provided, it is
  /// merged on top of the default style so callers can override only the
  /// properties they care about.
  final ButtonStyle? primaryStyle;

  /// Explicit [ButtonStyle] for the secondary variant.
  final ButtonStyle? secondaryStyle;

  /// Label text style. Merged with the button's default text style.
  final TextStyle? textStyle;

  /// Internal padding of the button.
  final EdgeInsetsGeometry? padding;

  /// Minimum size of the button. Defaults to 44pt height (accessibility).
  final Size? minimumSize;

  /// Corner radius. If provided, a [RoundedRectangleBorder] is used as shape.
  final BorderRadius? borderRadius;

  /// Explicit border (applied together with [borderRadius] when both are set).
  final BorderSide? border;

  /// Elevation for the primary (elevated) variant.
  final double? elevation;

  /// Explicit background color. Overrides [IamContent.backgroundColor].
  final Color? backgroundColor;

  /// Explicit foreground (text/icon) color. Overrides [IamContent.textColor].
  final Color? foregroundColor;

  /// Ripple/hover overlay color.
  final Color? overlayColor;

  /// Optional leading/trailing icon.
  final Widget? icon;

  /// Where to place [icon] relative to the label.
  ///
  /// When `null`, falls back to [IamCta.style]`.iconAlignment` from the
  /// JSON payload, or [IamCtaIconAlignment.start] when unset.
  final IamCtaIconAlignment? iconAlignment;

  /// Optional builder to fully customize the label widget.
  final Widget Function(BuildContext context, IamCta cta)? labelBuilder;

  /// When true, shows [loadingIndicator] (or a default spinner) and disables
  /// interaction.
  final bool isLoading;

  /// Custom loading indicator. Defaults to a 16pt [CircularProgressIndicator].
  final Widget? loadingIndicator;

  /// When false, disables the button regardless of [isLoading].
  ///
  /// When `null`, falls back to [IamCta.style]`.enabled` from the JSON
  /// payload, defaulting to `true` when unset.
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    // JSON-provided fallbacks. Widget-level params always win.
    final js = cta.style;

    final effBg =
        backgroundColor ??
        parseIamColor(js?.backgroundColor) ??
        parseIamColor(content?.backgroundColor);
    final effFg =
        foregroundColor ??
        parseIamColor(js?.foregroundColor) ??
        parseIamColor(content?.textColor);
    final effOverlay = overlayColor ?? parseIamColor(js?.overlayColor);
    final effTextStyle = textStyle ?? js?.textStyle?.toTextStyle();
    final effPadding = padding ?? js?.padding?.toEdgeInsets();
    final effMinimumSize = resolveStyle<Size>(
      minimumSize,
      js?.minimumSize?.toSize(),
      const Size.fromHeight(44),
    );
    final effBorderRadius = borderRadius ?? js?.borderRadius?.toBorderRadius();
    final effBorder = border ?? js?.border?.toBorderSide();
    final effElevation = elevation ?? js?.elevation;
    final effIconAlignment = resolveStyle<IamCtaIconAlignment>(
      iconAlignment,
      js?.iconAlignment == IamCtaIconAlignmentJson.end
          ? IamCtaIconAlignment.end
          : null,
      IamCtaIconAlignment.start,
    );
    final effEnabled = resolveStyle<bool>(enabled, js?.enabled, true);

    final effectiveOnPressed = (effEnabled && !isLoading) ? onPressed : null;

    final shape = effBorderRadius == null && effBorder == null
        ? null
        : RoundedRectangleBorder(
            borderRadius: effBorderRadius ?? BorderRadius.circular(8),
            side: effBorder ?? BorderSide.none,
          );

    final label = isLoading
        ? (loadingIndicator ??
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: effFg == null
                      ? null
                      : AlwaysStoppedAnimation<Color>(effFg),
                ),
              ))
        : (labelBuilder?.call(context, cta) ??
              Text(cta.label, style: effTextStyle));

    final child = (icon == null || isLoading)
        ? label
        : _IconRow(icon: icon!, label: label, alignment: effIconAlignment);

    final baseStyle = _buildBaseStyle(
      primary: isPrimary,
      bg: effBg,
      fg: effFg,
      overlay: effOverlay,
      minimumSize: effMinimumSize,
      padding: effPadding,
      shape: shape,
      elevation: effElevation,
      textStyle: effTextStyle,
    );

    if (isPrimary) {
      return ElevatedButton(
        style: primaryStyle == null
            ? baseStyle
            : baseStyle.merge(primaryStyle),
        onPressed: effectiveOnPressed,
        child: child,
      );
    }
    return TextButton(
      style: secondaryStyle == null
          ? baseStyle
          : baseStyle.merge(secondaryStyle),
      onPressed: effectiveOnPressed,
      child: child,
    );
  }

  /// Shared base style for both primary ([ElevatedButton]) and secondary
  /// ([TextButton]) variants. Centralizes the `styleFrom(...).copyWith(...)`
  /// boilerplate so both branches stay in sync.
  ButtonStyle _buildBaseStyle({
    required bool primary,
    required Color? bg,
    required Color? fg,
    required Color? overlay,
    required Size minimumSize,
    required EdgeInsetsGeometry? padding,
    required OutlinedBorder? shape,
    required double? elevation,
    required TextStyle? textStyle,
  }) {
    final base = primary
        ? ElevatedButton.styleFrom(
            backgroundColor: bg,
            foregroundColor: fg,
            minimumSize: minimumSize,
            padding: padding,
            shape: shape,
            elevation: elevation,
            textStyle: textStyle,
          )
        : TextButton.styleFrom(
            foregroundColor: fg,
            minimumSize: minimumSize,
            padding: padding,
            shape: shape,
            textStyle: textStyle,
          );
    if (overlay == null) return base;
    return base.copyWith(overlayColor: WidgetStatePropertyAll<Color>(overlay));
  }
}

class _IconRow extends StatelessWidget {
  const _IconRow({
    required this.icon,
    required this.label,
    required this.alignment,
  });

  final Widget icon;
  final Widget label;
  final IamCtaIconAlignment alignment;

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(width: 8);
    final children = alignment == IamCtaIconAlignment.start
        ? <Widget>[icon, gap, Flexible(child: label)]
        : <Widget>[Flexible(child: label), gap, icon];
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
