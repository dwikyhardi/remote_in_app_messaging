import 'package:flutter/material.dart';

import '../../domain/entities/iam_style.dart';

/// Parses a `#RRGGBB` or `#AARRGGBB` hex string into a [Color].
///
/// Returns `null` when the input is null/empty or malformed so callers can
/// fall back to other defaults.
Color? parseIamColor(String? hex) {
  if (hex == null || hex.isEmpty) return null;
  final cleaned = hex.replaceFirst('#', '').trim();
  if (cleaned.length != 6 && cleaned.length != 8) return null;
  final value = int.tryParse(cleaned, radix: 16);
  if (value == null) return null;
  return Color(cleaned.length == 6 ? (0xFF000000 | value) : value);
}

extension IamEdgeInsetsExt on IamEdgeInsets {
  EdgeInsets toEdgeInsets() {
    if (all != null) return EdgeInsets.all(all!);
    if (horizontal != null || vertical != null) {
      return EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      );
    }
    return EdgeInsets.only(
      left: left ?? 0,
      top: top ?? 0,
      right: right ?? 0,
      bottom: bottom ?? 0,
    );
  }
}

extension IamSizeExt on IamSize {
  Size toSize() {
    // `double.infinity` keeps parity with [Size.fromHeight] when only one
    // dimension is supplied.
    return Size(width ?? double.infinity, height ?? 0);
  }
}

extension IamBorderRadiusExt on IamBorderRadius {
  BorderRadius toBorderRadius() {
    if (all != null) return BorderRadius.circular(all!);
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0),
      topRight: Radius.circular(topRight ?? 0),
      bottomLeft: Radius.circular(bottomLeft ?? 0),
      bottomRight: Radius.circular(bottomRight ?? 0),
    );
  }
}

extension IamBorderSideExt on IamBorderSide {
  BorderSide toBorderSide() {
    final c = parseIamColor(color);
    return BorderSide(
      color: c ?? const Color(0xFF000000),
      width: width,
    );
  }
}

// ---------------------------------------------------------------------------
// Enum lookup tables
// ---------------------------------------------------------------------------
//
// Replace the previous boilerplate `switch` statements with const Map lookups.
// Coverage is enforced statically by the round-trip tests in
// `test/iam_style_test.dart` (every variant must be present here).

const Map<IamNamedAlignment, Alignment> _kNamedAlignment =
    <IamNamedAlignment, Alignment>{
      IamNamedAlignment.topLeft: Alignment.topLeft,
      IamNamedAlignment.topCenter: Alignment.topCenter,
      IamNamedAlignment.topRight: Alignment.topRight,
      IamNamedAlignment.centerLeft: Alignment.centerLeft,
      IamNamedAlignment.center: Alignment.center,
      IamNamedAlignment.centerRight: Alignment.centerRight,
      IamNamedAlignment.bottomLeft: Alignment.bottomLeft,
      IamNamedAlignment.bottomCenter: Alignment.bottomCenter,
      IamNamedAlignment.bottomRight: Alignment.bottomRight,
    };

const Map<IamFontWeight, FontWeight> _kFontWeight = <IamFontWeight, FontWeight>{
  IamFontWeight.w100: FontWeight.w100,
  IamFontWeight.w200: FontWeight.w200,
  IamFontWeight.w300: FontWeight.w300,
  IamFontWeight.w400: FontWeight.w400,
  IamFontWeight.normal: FontWeight.w400,
  IamFontWeight.w500: FontWeight.w500,
  IamFontWeight.w600: FontWeight.w600,
  IamFontWeight.w700: FontWeight.w700,
  IamFontWeight.bold: FontWeight.w700,
  IamFontWeight.w800: FontWeight.w800,
  IamFontWeight.w900: FontWeight.w900,
};

const Map<IamFontStyle, FontStyle> _kFontStyle = <IamFontStyle, FontStyle>{
  IamFontStyle.normal: FontStyle.normal,
  IamFontStyle.italic: FontStyle.italic,
};

const Map<IamBoxFit, BoxFit> _kBoxFit = <IamBoxFit, BoxFit>{
  IamBoxFit.fill: BoxFit.fill,
  IamBoxFit.contain: BoxFit.contain,
  IamBoxFit.cover: BoxFit.cover,
  IamBoxFit.fitWidth: BoxFit.fitWidth,
  IamBoxFit.fitHeight: BoxFit.fitHeight,
  IamBoxFit.none: BoxFit.none,
  IamBoxFit.scaleDown: BoxFit.scaleDown,
};

const Map<IamCrossAxisAlignment, CrossAxisAlignment> _kCrossAxisAlignment =
    <IamCrossAxisAlignment, CrossAxisAlignment>{
      IamCrossAxisAlignment.start: CrossAxisAlignment.start,
      IamCrossAxisAlignment.end: CrossAxisAlignment.end,
      IamCrossAxisAlignment.center: CrossAxisAlignment.center,
      IamCrossAxisAlignment.stretch: CrossAxisAlignment.stretch,
      IamCrossAxisAlignment.baseline: CrossAxisAlignment.baseline,
    };

const Map<IamTextAlign, TextAlign> _kTextAlign = <IamTextAlign, TextAlign>{
  IamTextAlign.left: TextAlign.left,
  IamTextAlign.right: TextAlign.right,
  IamTextAlign.center: TextAlign.center,
  IamTextAlign.justify: TextAlign.justify,
  IamTextAlign.start: TextAlign.start,
  IamTextAlign.end: TextAlign.end,
};

extension IamAlignmentExt on IamAlignment {
  AlignmentGeometry toAlignment() {
    final n = named;
    if (n != null) return _kNamedAlignment[n]!;
    return Alignment(x ?? 0, y ?? 0);
  }
}

extension IamFontWeightExt on IamFontWeight {
  FontWeight toFontWeight() => _kFontWeight[this]!;
}

extension IamFontStyleExt on IamFontStyle {
  FontStyle toFontStyle() => _kFontStyle[this]!;
}

extension IamTextStyleExt on IamTextStyle {
  TextStyle toTextStyle() {
    return TextStyle(
      color: parseIamColor(color),
      fontSize: fontSize,
      fontWeight: fontWeight?.toFontWeight(),
      fontStyle: fontStyle?.toFontStyle(),
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      fontFamily: fontFamily,
    );
  }
}

extension IamBoxFitExt on IamBoxFit {
  BoxFit toBoxFit() => _kBoxFit[this]!;
}

extension IamCrossAxisAlignmentExt on IamCrossAxisAlignment {
  CrossAxisAlignment toCrossAxisAlignment() => _kCrossAxisAlignment[this]!;
}

extension IamTextAlignExt on IamTextAlign {
  TextAlign toTextAlign() => _kTextAlign[this]!;
}
