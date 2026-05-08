import 'package:freezed_annotation/freezed_annotation.dart';

part 'iam_style.freezed.dart';
part 'iam_style.g.dart';

// ---------------------------------------------------------------------------
// Shared JSON-friendly primitives used by `IamCtaButtonStyle` and
// `IamBodyStyle`.
//
// These mirror a minimal subset of Flutter styling types so the whole visual
// configuration of the IAM widgets can travel in the remote JSON payload
// (e.g. Firebase Remote Config) without pulling in `dart:ui` / `flutter` types.
//
// Conversion to Flutter types happens in `lib/src/presentation/widgets/...`
// via extension methods declared next to the widgets.
// ---------------------------------------------------------------------------

/// JSON enum mirroring Flutter's `BoxFit`. Only the common cases are
/// exposed.
enum IamBoxFit {
  @JsonValue('fill')
  fill,
  @JsonValue('contain')
  contain,
  @JsonValue('cover')
  cover,
  @JsonValue('fit_width')
  fitWidth,
  @JsonValue('fit_height')
  fitHeight,
  @JsonValue('none')
  none,
  @JsonValue('scale_down')
  scaleDown,
}

/// JSON enum mirroring Flutter's `CrossAxisAlignment` for the body column.
enum IamCrossAxisAlignment {
  @JsonValue('start')
  start,
  @JsonValue('end')
  end,
  @JsonValue('center')
  center,
  @JsonValue('stretch')
  stretch,
  @JsonValue('baseline')
  baseline,
}

/// JSON enum mirroring Flutter's `TextAlign` for the title and body texts.
enum IamTextAlign {
  @JsonValue('left')
  left,
  @JsonValue('right')
  right,
  @JsonValue('center')
  center,
  @JsonValue('justify')
  justify,
  @JsonValue('start')
  start,
  @JsonValue('end')
  end,
}

/// JSON enum mirroring Flutter's `FontWeight`.
enum IamFontWeight {
  @JsonValue('w100')
  w100,
  @JsonValue('w200')
  w200,
  @JsonValue('w300')
  w300,
  @JsonValue('w400')
  w400,
  @JsonValue('w500')
  w500,
  @JsonValue('w600')
  w600,
  @JsonValue('w700')
  w700,
  @JsonValue('w800')
  w800,
  @JsonValue('w900')
  w900,
  @JsonValue('normal')
  normal,
  @JsonValue('bold')
  bold,
}

/// JSON enum mirroring Flutter's `FontStyle`.
enum IamFontStyle {
  @JsonValue('normal')
  normal,
  @JsonValue('italic')
  italic,
}

/// JSON enum for a small named `Alignment` grid. Arbitrary `(x, y)` pairs
/// can be expressed via [IamAlignment].
enum IamNamedAlignment {
  @JsonValue('top_left')
  topLeft,
  @JsonValue('top_center')
  topCenter,
  @JsonValue('top_right')
  topRight,
  @JsonValue('center_left')
  centerLeft,
  @JsonValue('center')
  center,
  @JsonValue('center_right')
  centerRight,
  @JsonValue('bottom_left')
  bottomLeft,
  @JsonValue('bottom_center')
  bottomCenter,
  @JsonValue('bottom_right')
  bottomRight,
}

/// JSON enum for the icon position inside an `IamCtaButton`.
enum IamCtaIconAlignmentJson {
  @JsonValue('start')
  start,
  @JsonValue('end')
  end,
}

/// JSON-friendly `EdgeInsets`. When `all` is provided, the other fields are
/// ignored.
@freezed
abstract class IamEdgeInsets with _$IamEdgeInsets {
  const factory IamEdgeInsets({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) = _IamEdgeInsets;

  factory IamEdgeInsets.fromJson(Map<String, dynamic> json) =>
      _$IamEdgeInsetsFromJson(json);
}

/// JSON-friendly `Size` (width / height).
@freezed
abstract class IamSize with _$IamSize {
  const factory IamSize({
    double? width,
    double? height,
  }) = _IamSize;

  factory IamSize.fromJson(Map<String, dynamic> json) =>
      _$IamSizeFromJson(json);
}

/// JSON-friendly `BorderRadius`. When `all` is provided, it is applied to
/// every corner.
@freezed
abstract class IamBorderRadius with _$IamBorderRadius {
  const factory IamBorderRadius({
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) = _IamBorderRadius;

  factory IamBorderRadius.fromJson(Map<String, dynamic> json) =>
      _$IamBorderRadiusFromJson(json);
}

/// JSON-friendly `BorderSide`.
@freezed
abstract class IamBorderSide with _$IamBorderSide {
  const factory IamBorderSide({
    String? color,
    @Default(1.0) double width,
  }) = _IamBorderSide;

  factory IamBorderSide.fromJson(Map<String, dynamic> json) =>
      _$IamBorderSideFromJson(json);
}

/// Arbitrary `(x, y)` alignment in `[-1, 1]` — equivalent to
/// `Alignment(x, y)`. If `named` is provided, it wins over `(x, y)`.
@freezed
abstract class IamAlignment with _$IamAlignment {
  const factory IamAlignment({
    IamNamedAlignment? named,
    double? x,
    double? y,
  }) = _IamAlignment;

  factory IamAlignment.fromJson(Map<String, dynamic> json) =>
      _$IamAlignmentFromJson(json);
}

/// JSON-friendly `TextStyle`. Only the most useful properties are exposed.
@freezed
abstract class IamTextStyle with _$IamTextStyle {
  const factory IamTextStyle({
    String? color,
    double? fontSize,
    IamFontWeight? fontWeight,
    IamFontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    String? fontFamily,
  }) = _IamTextStyle;

  factory IamTextStyle.fromJson(Map<String, dynamic> json) =>
      _$IamTextStyleFromJson(json);
}

// ---------------------------------------------------------------------------
// IamCtaButtonStyle — JSON counterpart of the styling parameters exposed by
// `IamCtaButton`.
// ---------------------------------------------------------------------------

/// All visual parameters of `IamCtaButton` that can be expressed in JSON.
///
/// Widget-level constructor arguments on `IamCtaButton` always win over these
/// values (`style` is only consulted as a fallback). See
/// `IamCtaButton.build` for the merge rules.
@freezed
abstract class IamCtaButtonStyle with _$IamCtaButtonStyle {
  const factory IamCtaButtonStyle({
    // Colors
    String? backgroundColor,
    String? foregroundColor,
    String? overlayColor,
    // Text
    IamTextStyle? textStyle,
    // Spacing / sizing
    IamEdgeInsets? padding,
    IamSize? minimumSize,
    // Shape
    IamBorderRadius? borderRadius,
    IamBorderSide? border,
    double? elevation,
    // Icon
    IamCtaIconAlignmentJson? iconAlignment,
    // Behavior
    bool? enabled,
  }) = _IamCtaButtonStyle;

  factory IamCtaButtonStyle.fromJson(Map<String, dynamic> json) =>
      _$IamCtaButtonStyleFromJson(json);
}

// ---------------------------------------------------------------------------
// IamBodyStyle — JSON counterpart of the layout / styling parameters exposed
// by `IamBody`.
// ---------------------------------------------------------------------------

/// All visual parameters of `IamBody` that can be expressed in JSON.
///
/// Widget-level constructor arguments on `IamBody` always win over these
/// values (`style` is only consulted as a fallback). See
/// `IamBody.build` for the merge rules.
@freezed
abstract class IamBodyStyle with _$IamBodyStyle {
  const factory IamBodyStyle({
    // Layout / spacing
    IamEdgeInsets? padding,
    double? imageBottomSpacing,
    double? titleBottomSpacing,
    double? bodyBottomSpacing,
    double? primaryCtaBottomSpacing,
    IamCrossAxisAlignment? crossAxisAlignment,
    IamTextAlign? textAlign,
    bool? scrollable,
    // Background
    String? backgroundColor,
    // Text styles
    IamTextStyle? titleStyle,
    IamTextStyle? bodyStyle,
    // Image
    IamBoxFit? imageFit,
    double? imageHeight,
    double? imageWidth,
    IamBorderRadius? imageBorderRadius,
    // Close button
    bool? showCloseButton,
    String? closeIconColor,
    String? closeButtonBackgroundColor,
    IamAlignment? closeButtonAlignment,
    String? closeButtonTooltip,
    // CTA passthrough
    IamCtaButtonStyle? primaryCtaStyle,
    IamCtaButtonStyle? secondaryCtaStyle,
    IamSize? ctaMinimumSize,
    IamBorderRadius? ctaBorderRadius,
  }) = _IamBodyStyle;

  factory IamBodyStyle.fromJson(Map<String, dynamic> json) =>
      _$IamBodyStyleFromJson(json);
}
