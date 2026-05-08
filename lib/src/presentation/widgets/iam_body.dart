import 'package:flutter/material.dart';

import '../../domain/entities/iam_content.dart';
import '../../domain/entities/iam_cta.dart';
import '../../domain/entities/iam_cta_ext.dart';
import '../../domain/entities/iam_style.dart';
import 'iam_cta_button.dart';
import 'iam_style_ext.dart';
import 'iam_style_resolver.dart';

/// Signature for fully customizing the image slot in [IamBody].
typedef IamBodyImageBuilder =
    Widget Function(
      BuildContext context,
      String imageUrl,
    );

/// Signature for fully customizing the close button in [IamBody].
typedef IamBodyCloseButtonBuilder =
    Widget Function(
      BuildContext context,
      VoidCallback onClose,
    );

/// Shared body layout for modal / bottom sheet / fullscreen renderers:
/// optional image → title → body → up to two CTAs.
///
/// All layout / styling parameters are optional and default to the original
/// centered design so existing renderers keep working unchanged.
class IamBody extends StatelessWidget {
  const IamBody({
    super.key,
    required this.content,
    required this.onPrimaryCta,
    required this.onSecondaryCta,
    required this.onClose,
    this.fullscreen = false,
    // --- Layout / spacing --------------------------------------------------
    this.padding,
    this.imageBottomSpacing,
    this.titleBottomSpacing,
    this.bodyBottomSpacing,
    this.primaryCtaBottomSpacing,
    this.crossAxisAlignment,
    this.textAlign,
    this.scrollable,
    // --- Background --------------------------------------------------------
    this.backgroundColor,
    this.decoration,
    // --- Text styles -------------------------------------------------------
    this.titleStyle,
    this.bodyStyle,
    // --- Image -------------------------------------------------------------
    this.imageFit,
    this.imageHeight,
    this.imageBorderRadius,
    this.imageErrorBuilder,
    this.imageBuilder,
    // --- Close button ------------------------------------------------------
    this.showCloseButton,
    this.closeIcon = const Icon(Icons.close),
    this.closeIconColor,
    this.closeButtonBackgroundColor,
    this.closeButtonAlignment,
    this.closeButtonTooltip,
    this.closeButtonBuilder,
    // --- CTA passthrough ---------------------------------------------------
    this.primaryCtaStyle,
    this.secondaryCtaStyle,
    this.ctaMinimumSize,
    this.ctaBorderRadius,
  });

  final IamContent content;
  final VoidCallback onPrimaryCta;
  final VoidCallback onSecondaryCta;
  final VoidCallback onClose;
  final bool fullscreen;

  /// Outer padding around the body column.
  ///
  /// Falls back to [IamContent.style]`.padding` from the JSON payload, then
  /// to `EdgeInsets.all(20)`.
  final EdgeInsetsGeometry? padding;

  /// Vertical spacing after the image block (if any).
  ///
  /// Falls back to [IamContent.style]`.imageBottomSpacing` then to `16`.
  final double? imageBottomSpacing;

  /// Vertical spacing after the title.
  ///
  /// Falls back to [IamContent.style]`.titleBottomSpacing` then to `8`.
  final double? titleBottomSpacing;

  /// Vertical spacing after the body text.
  ///
  /// Falls back to [IamContent.style]`.bodyBottomSpacing` then to `16`.
  final double? bodyBottomSpacing;

  /// Vertical spacing between the primary and secondary CTA.
  ///
  /// Falls back to [IamContent.style]`.primaryCtaBottomSpacing` then to `8`.
  final double? primaryCtaBottomSpacing;

  /// Horizontal alignment of the main column's children.
  ///
  /// Falls back to [IamContent.style]`.crossAxisAlignment` then to
  /// [CrossAxisAlignment.stretch].
  final CrossAxisAlignment? crossAxisAlignment;

  /// Text alignment used for the title and body texts.
  ///
  /// Falls back to [IamContent.style]`.textAlign` then to [TextAlign.center].
  final TextAlign? textAlign;

  /// Whether the content is wrapped in a [SingleChildScrollView]. When `null`
  /// (default), scrolling is enabled only when [fullscreen] is true (legacy
  /// behavior).
  final bool? scrollable;

  /// Background color behind the body. Ignored if [decoration] is provided.
  final Color? backgroundColor;

  /// Background decoration. Takes precedence over [backgroundColor].
  final Decoration? decoration;

  /// Text style for the title. Defaults to `Theme.textTheme.titleLarge`.
  final TextStyle? titleStyle;

  /// Text style for the body. Defaults to `Theme.textTheme.bodyMedium`.
  final TextStyle? bodyStyle;

  /// [BoxFit] for the network image.
  ///
  /// Falls back to [IamContent.style]`.imageFit` then to [BoxFit.cover].
  final BoxFit? imageFit;

  /// Fixed height for the network image (null = intrinsic).
  final double? imageHeight;

  /// Corner radius applied to the image (uses [ClipRRect]).
  final BorderRadius? imageBorderRadius;

  /// Custom error builder for the network image. Defaults to an empty widget.
  final ImageErrorWidgetBuilder? imageErrorBuilder;

  /// Full custom builder for the image slot. Replaces the default
  /// [Image.network].
  final IamBodyImageBuilder? imageBuilder;

  /// Whether to render the top-right close button.
  ///
  /// Falls back to [IamContent.style]`.showCloseButton` then to `true`.
  final bool? showCloseButton;

  /// Icon widget used by the default close button.
  final Widget closeIcon;

  /// Color for the default close [Icon]. Ignored when [closeIcon] already
  /// provides its own color.
  final Color? closeIconColor;

  /// Background color painted behind the default close button (rendered as a
  /// circular chip). Useful to keep the icon visible when the body shows a
  /// full-bleed image at the top.
  ///
  /// Falls back to [IamContent.style]`.closeButtonBackgroundColor`, then —
  /// only when the body has an image — to a translucent black scrim.
  final Color? closeButtonBackgroundColor;

  /// Alignment of the close button within the body [Stack].
  ///
  /// Falls back to [IamContent.style]`.closeButtonAlignment` then to
  /// [Alignment.topRight].
  final AlignmentGeometry? closeButtonAlignment;

  /// Tooltip for the default close button.
  ///
  /// Falls back to [IamContent.style]`.closeButtonTooltip` then to `'Close'`.
  final String? closeButtonTooltip;

  /// Full custom builder for the close button.
  final IamBodyCloseButtonBuilder? closeButtonBuilder;

  /// Optional style forwarded to the primary [IamCtaButton].
  final ButtonStyle? primaryCtaStyle;

  /// Optional style forwarded to the secondary [IamCtaButton].
  final ButtonStyle? secondaryCtaStyle;

  /// Optional minimum size forwarded to both CTA buttons.
  final Size? ctaMinimumSize;

  /// Optional corner radius forwarded to both CTA buttons.
  final BorderRadius? ctaBorderRadius;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final js = content.style;

    // Style precedence is centralized in [resolveStyle]:
    //   widget-level argument > JSON-payload `style` > built-in default.
    final effPadding = resolveStyle<EdgeInsetsGeometry>(
      padding,
      js?.padding?.toEdgeInsets(),
      const EdgeInsets.all(20),
    );
    final effImageBottom =
        resolveStyle<double>(imageBottomSpacing, js?.imageBottomSpacing, 16);
    final effTitleBottom =
        resolveStyle<double>(titleBottomSpacing, js?.titleBottomSpacing, 8);
    final effBodyBottom =
        resolveStyle<double>(bodyBottomSpacing, js?.bodyBottomSpacing, 16);
    final effPrimaryCtaBottom = resolveStyle<double>(
      primaryCtaBottomSpacing,
      js?.primaryCtaBottomSpacing,
      8,
    );
    final effCrossAxis = resolveStyle<CrossAxisAlignment>(
      crossAxisAlignment,
      js?.crossAxisAlignment?.toCrossAxisAlignment(),
      CrossAxisAlignment.stretch,
    );
    final effTextAlign = resolveStyle<TextAlign>(
      textAlign,
      js?.textAlign?.toTextAlign(),
      TextAlign.center,
    );
    final effScrollable = scrollable ?? js?.scrollable;
    final effShowClose =
        resolveStyle<bool>(showCloseButton, js?.showCloseButton, true);
    final effBackground = backgroundColor ?? parseIamColor(js?.backgroundColor);
    final effTitleStyle = titleStyle ?? js?.titleStyle?.toTextStyle();
    final effBodyStyle = bodyStyle ?? js?.bodyStyle?.toTextStyle();

    final useScroll = effScrollable ?? fullscreen;

    final children = <Widget>[
      if (_hasImage)
        Padding(
          padding: EdgeInsets.only(bottom: effImageBottom),
          child: Semantics(
            identifier: 'iam-image',
            child: _buildImage(context),
          ),
        ),
      if (content.title.isNotEmpty)
        Padding(
          padding: EdgeInsets.only(bottom: effTitleBottom),
          child: Semantics(
            identifier: 'iam-title',
            child: Text(
              content.title,
              style: effTitleStyle ?? text.titleLarge,
              textAlign: effTextAlign,
            ),
          ),
        ),
      if (content.body.isNotEmpty)
        Padding(
          padding: EdgeInsets.only(bottom: effBodyBottom),
          child: Semantics(
            identifier: 'iam-body-content',
            child: Text(
              content.body,
              style: effBodyStyle ?? text.bodyMedium,
              textAlign: effTextAlign,
            ),
          ),
        ),
      if (content.primaryCta != null)
        Padding(
          padding: EdgeInsets.only(bottom: effPrimaryCtaBottom),
          child: Semantics(
            identifier: 'iam-primary-cta',
            button: true,
            child: _buildCta(
              context,
              cta: content.primaryCta!,
              primary: true,
              fallbackStyle: js?.primaryCtaStyle,
            ),
          ),
        ),
      if (content.secondaryCta != null)
        Semantics(
          identifier: 'iam-secondary-cta',
          button: true,
          child: _buildCta(
            context,
            cta: content.secondaryCta!,
            primary: false,
            fallbackStyle: js?.secondaryCtaStyle,
          ),
        ),
    ];

    final Widget column = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: effCrossAxis,
      children: children,
    );

    final Widget padded = Padding(padding: effPadding, child: column);

    final content0 = useScroll
        ? Center(child: SingleChildScrollView(child: padded))
        : padded;

    final Widget stacked = Stack(
      children: <Widget>[
        Semantics(
          identifier: 'iam-body',
          explicitChildNodes: true,
          child: content0,
        ),
        if (effShowClose) _buildPositionedClose(context),
      ],
    );

    if (decoration != null || effBackground != null) {
      return DecoratedBox(
        decoration: decoration ?? BoxDecoration(color: effBackground),
        child: stacked,
      );
    }
    return stacked;
  }

  bool get _hasImage =>
      content.imageUrl != null && content.imageUrl!.isNotEmpty;

  /// Builds the close button wrapped in a [Positioned] so it does not force
  /// the parent [Stack] to expand to the maximum available constraints.
  ///
  /// [closeButtonAlignment] stays fully configurable: we resolve the
  /// [AlignmentGeometry] against the current [Directionality] and map the
  /// resulting `x`/`y` in `[-1, 1]` to `left/right/top/bottom` edge insets.
  Widget _buildPositionedClose(BuildContext context) {
    final js = content.style;
    final effAlignment = resolveStyle<AlignmentGeometry>(
      closeButtonAlignment,
      js?.closeButtonAlignment?.toAlignment(),
      Alignment.topRight,
    );
    final effTooltip = resolveStyle<String>(
      closeButtonTooltip,
      js?.closeButtonTooltip,
      'Close',
    );

    // When the body shows a full-bleed image at the top, the bare close icon
    // can blend into the image and become unreadable. We default to a
    // translucent black chip + white icon so the affordance always stays
    // visible. Both can be overridden via widget args or JSON style.
    final effBgColor =
        closeButtonBackgroundColor ??
        parseIamColor(js?.closeButtonBackgroundColor) ??
        (_hasImage ? Colors.black54 : null);
    final effCloseIconColor =
        closeIconColor ??
        parseIamColor(js?.closeIconColor) ??
        (_hasImage ? Colors.white : null);

    final resolved = effAlignment.resolve(Directionality.of(context));

    const double edgeInset = 4;

    // Vertical: -1 = top, 0 = center, 1 = bottom.
    final top = resolved.y <= 0 ? edgeInset : null;
    final bottom = resolved.y > 0 ? edgeInset : null;

    // Horizontal: -1 = left, 0 = center, 1 = right.
    final left = resolved.x < 0 ? edgeInset : null;
    final right = resolved.x >= 0 ? edgeInset : null;

    var button =
        closeButtonBuilder?.call(context, onClose) ??
        IconButton(
          icon: effCloseIconColor == null
              ? closeIcon
              : IconTheme(
                  data: IconThemeData(color: effCloseIconColor),
                  child: closeIcon,
                ),
          tooltip: effTooltip,
          onPressed: onClose,
        );

    // Only wrap the default `IconButton` in a circular background chip; if
    // the host fully customized the close button via [closeButtonBuilder] we
    // do not interfere with their layout.
    if (effBgColor != null && closeButtonBuilder == null) {
      button = Material(
        color: effBgColor,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: button,
      );
    }

    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Semantics(identifier: 'iam-close-button', child: button),
    );
  }

  Widget _buildImage(BuildContext context) {
    final url = content.imageUrl!;
    if (imageBuilder != null) return imageBuilder!(context, url);

    final js = content.style;
    final effFit = resolveStyle<BoxFit>(
      imageFit,
      js?.imageFit?.toBoxFit(),
      BoxFit.cover,
    );
    final effHeight = imageHeight ?? js?.imageHeight;
    final effRadius =
        imageBorderRadius ?? js?.imageBorderRadius?.toBorderRadius();

    Widget img = Image.network(
      url,
      fit: effFit,
      height: effHeight,
      errorBuilder: imageErrorBuilder ?? (_, _, _) => const SizedBox.shrink(),
    );
    if (effRadius != null) {
      img = ClipRRect(borderRadius: effRadius, child: img);
    }
    return img;
  }

  /// Single CTA builder that renders either the primary or the secondary
  /// button. Per-CTA JSON `style` wins over the body-level [fallbackStyle].
  Widget _buildCta(
    BuildContext context, {
    required IamCta cta,
    required bool primary,
    required IamCtaButtonStyle? fallbackStyle,
  }) {
    final js = content.style;
    final effMin = resolveStyle<Size>(
      ctaMinimumSize,
      js?.ctaMinimumSize?.toSize(),
      const Size.fromHeight(44),
    );
    final effRadius = ctaBorderRadius ?? js?.ctaBorderRadius?.toBorderRadius();

    final resolvedCta = cta.withFallbackStyle(fallbackStyle);

    return IamCtaButton(
      cta: resolvedCta,
      onPressed: primary ? onPrimaryCta : onSecondaryCta,
      isPrimary: primary,
      content: content,
      primaryStyle: primary ? primaryCtaStyle : null,
      secondaryStyle: primary ? null : secondaryCtaStyle,
      minimumSize: effMin,
      borderRadius: effRadius,
    );
  }
}
