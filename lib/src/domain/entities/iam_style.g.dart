// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iam_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IamEdgeInsets _$IamEdgeInsetsFromJson(Map<String, dynamic> json) =>
    _IamEdgeInsets(
      all: (json['all'] as num?)?.toDouble(),
      horizontal: (json['horizontal'] as num?)?.toDouble(),
      vertical: (json['vertical'] as num?)?.toDouble(),
      left: (json['left'] as num?)?.toDouble(),
      top: (json['top'] as num?)?.toDouble(),
      right: (json['right'] as num?)?.toDouble(),
      bottom: (json['bottom'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$IamEdgeInsetsToJson(_IamEdgeInsets instance) =>
    <String, dynamic>{
      'all': instance.all,
      'horizontal': instance.horizontal,
      'vertical': instance.vertical,
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
    };

_IamSize _$IamSizeFromJson(Map<String, dynamic> json) => _IamSize(
  width: (json['width'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
);

Map<String, dynamic> _$IamSizeToJson(_IamSize instance) => <String, dynamic>{
  'width': instance.width,
  'height': instance.height,
};

_IamBorderRadius _$IamBorderRadiusFromJson(Map<String, dynamic> json) =>
    _IamBorderRadius(
      all: (json['all'] as num?)?.toDouble(),
      topLeft: (json['topLeft'] as num?)?.toDouble(),
      topRight: (json['topRight'] as num?)?.toDouble(),
      bottomLeft: (json['bottomLeft'] as num?)?.toDouble(),
      bottomRight: (json['bottomRight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$IamBorderRadiusToJson(_IamBorderRadius instance) =>
    <String, dynamic>{
      'all': instance.all,
      'topLeft': instance.topLeft,
      'topRight': instance.topRight,
      'bottomLeft': instance.bottomLeft,
      'bottomRight': instance.bottomRight,
    };

_IamBorderSide _$IamBorderSideFromJson(Map<String, dynamic> json) =>
    _IamBorderSide(
      color: json['color'] as String?,
      width: (json['width'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$IamBorderSideToJson(_IamBorderSide instance) =>
    <String, dynamic>{'color': instance.color, 'width': instance.width};

_IamAlignment _$IamAlignmentFromJson(Map<String, dynamic> json) =>
    _IamAlignment(
      named: $enumDecodeNullable(_$IamNamedAlignmentEnumMap, json['named']),
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$IamAlignmentToJson(_IamAlignment instance) =>
    <String, dynamic>{
      'named': _$IamNamedAlignmentEnumMap[instance.named],
      'x': instance.x,
      'y': instance.y,
    };

const _$IamNamedAlignmentEnumMap = {
  IamNamedAlignment.topLeft: 'top_left',
  IamNamedAlignment.topCenter: 'top_center',
  IamNamedAlignment.topRight: 'top_right',
  IamNamedAlignment.centerLeft: 'center_left',
  IamNamedAlignment.center: 'center',
  IamNamedAlignment.centerRight: 'center_right',
  IamNamedAlignment.bottomLeft: 'bottom_left',
  IamNamedAlignment.bottomCenter: 'bottom_center',
  IamNamedAlignment.bottomRight: 'bottom_right',
};

_IamTextStyle _$IamTextStyleFromJson(Map<String, dynamic> json) =>
    _IamTextStyle(
      color: json['color'] as String?,
      fontSize: (json['fontSize'] as num?)?.toDouble(),
      fontWeight: $enumDecodeNullable(
        _$IamFontWeightEnumMap,
        json['fontWeight'],
      ),
      fontStyle: $enumDecodeNullable(_$IamFontStyleEnumMap, json['fontStyle']),
      letterSpacing: (json['letterSpacing'] as num?)?.toDouble(),
      wordSpacing: (json['wordSpacing'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      fontFamily: json['fontFamily'] as String?,
    );

Map<String, dynamic> _$IamTextStyleToJson(_IamTextStyle instance) =>
    <String, dynamic>{
      'color': instance.color,
      'fontSize': instance.fontSize,
      'fontWeight': _$IamFontWeightEnumMap[instance.fontWeight],
      'fontStyle': _$IamFontStyleEnumMap[instance.fontStyle],
      'letterSpacing': instance.letterSpacing,
      'wordSpacing': instance.wordSpacing,
      'height': instance.height,
      'fontFamily': instance.fontFamily,
    };

const _$IamFontWeightEnumMap = {
  IamFontWeight.w100: 'w100',
  IamFontWeight.w200: 'w200',
  IamFontWeight.w300: 'w300',
  IamFontWeight.w400: 'w400',
  IamFontWeight.w500: 'w500',
  IamFontWeight.w600: 'w600',
  IamFontWeight.w700: 'w700',
  IamFontWeight.w800: 'w800',
  IamFontWeight.w900: 'w900',
  IamFontWeight.normal: 'normal',
  IamFontWeight.bold: 'bold',
};

const _$IamFontStyleEnumMap = {
  IamFontStyle.normal: 'normal',
  IamFontStyle.italic: 'italic',
};

_IamCtaButtonStyle _$IamCtaButtonStyleFromJson(Map<String, dynamic> json) =>
    _IamCtaButtonStyle(
      backgroundColor: json['backgroundColor'] as String?,
      foregroundColor: json['foregroundColor'] as String?,
      overlayColor: json['overlayColor'] as String?,
      textStyle: json['textStyle'] == null
          ? null
          : IamTextStyle.fromJson(json['textStyle'] as Map<String, dynamic>),
      padding: json['padding'] == null
          ? null
          : IamEdgeInsets.fromJson(json['padding'] as Map<String, dynamic>),
      minimumSize: json['minimumSize'] == null
          ? null
          : IamSize.fromJson(json['minimumSize'] as Map<String, dynamic>),
      borderRadius: json['borderRadius'] == null
          ? null
          : IamBorderRadius.fromJson(
              json['borderRadius'] as Map<String, dynamic>,
            ),
      border: json['border'] == null
          ? null
          : IamBorderSide.fromJson(json['border'] as Map<String, dynamic>),
      elevation: (json['elevation'] as num?)?.toDouble(),
      iconAlignment: $enumDecodeNullable(
        _$IamCtaIconAlignmentJsonEnumMap,
        json['iconAlignment'],
      ),
      enabled: json['enabled'] as bool?,
    );

Map<String, dynamic> _$IamCtaButtonStyleToJson(_IamCtaButtonStyle instance) =>
    <String, dynamic>{
      'backgroundColor': instance.backgroundColor,
      'foregroundColor': instance.foregroundColor,
      'overlayColor': instance.overlayColor,
      'textStyle': instance.textStyle,
      'padding': instance.padding,
      'minimumSize': instance.minimumSize,
      'borderRadius': instance.borderRadius,
      'border': instance.border,
      'elevation': instance.elevation,
      'iconAlignment': _$IamCtaIconAlignmentJsonEnumMap[instance.iconAlignment],
      'enabled': instance.enabled,
    };

const _$IamCtaIconAlignmentJsonEnumMap = {
  IamCtaIconAlignmentJson.start: 'start',
  IamCtaIconAlignmentJson.end: 'end',
};

_IamBodyStyle _$IamBodyStyleFromJson(Map<String, dynamic> json) =>
    _IamBodyStyle(
      padding: json['padding'] == null
          ? null
          : IamEdgeInsets.fromJson(json['padding'] as Map<String, dynamic>),
      imageBottomSpacing: (json['imageBottomSpacing'] as num?)?.toDouble(),
      titleBottomSpacing: (json['titleBottomSpacing'] as num?)?.toDouble(),
      bodyBottomSpacing: (json['bodyBottomSpacing'] as num?)?.toDouble(),
      primaryCtaBottomSpacing: (json['primaryCtaBottomSpacing'] as num?)
          ?.toDouble(),
      crossAxisAlignment: $enumDecodeNullable(
        _$IamCrossAxisAlignmentEnumMap,
        json['crossAxisAlignment'],
      ),
      textAlign: $enumDecodeNullable(_$IamTextAlignEnumMap, json['textAlign']),
      scrollable: json['scrollable'] as bool?,
      backgroundColor: json['backgroundColor'] as String?,
      titleStyle: json['titleStyle'] == null
          ? null
          : IamTextStyle.fromJson(json['titleStyle'] as Map<String, dynamic>),
      bodyStyle: json['bodyStyle'] == null
          ? null
          : IamTextStyle.fromJson(json['bodyStyle'] as Map<String, dynamic>),
      imageFit: $enumDecodeNullable(_$IamBoxFitEnumMap, json['imageFit']),
      imageHeight: (json['imageHeight'] as num?)?.toDouble(),
      imageWidth: (json['imageWidth'] as num?)?.toDouble(),
      imageBorderRadius: json['imageBorderRadius'] == null
          ? null
          : IamBorderRadius.fromJson(
              json['imageBorderRadius'] as Map<String, dynamic>,
            ),
      showCloseButton: json['showCloseButton'] as bool?,
      closeIconColor: json['closeIconColor'] as String?,
      closeButtonBackgroundColor: json['closeButtonBackgroundColor'] as String?,
      closeButtonAlignment: json['closeButtonAlignment'] == null
          ? null
          : IamAlignment.fromJson(
              json['closeButtonAlignment'] as Map<String, dynamic>,
            ),
      closeButtonTooltip: json['closeButtonTooltip'] as String?,
      primaryCtaStyle: json['primaryCtaStyle'] == null
          ? null
          : IamCtaButtonStyle.fromJson(
              json['primaryCtaStyle'] as Map<String, dynamic>,
            ),
      secondaryCtaStyle: json['secondaryCtaStyle'] == null
          ? null
          : IamCtaButtonStyle.fromJson(
              json['secondaryCtaStyle'] as Map<String, dynamic>,
            ),
      ctaMinimumSize: json['ctaMinimumSize'] == null
          ? null
          : IamSize.fromJson(json['ctaMinimumSize'] as Map<String, dynamic>),
      ctaBorderRadius: json['ctaBorderRadius'] == null
          ? null
          : IamBorderRadius.fromJson(
              json['ctaBorderRadius'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$IamBodyStyleToJson(_IamBodyStyle instance) =>
    <String, dynamic>{
      'padding': instance.padding,
      'imageBottomSpacing': instance.imageBottomSpacing,
      'titleBottomSpacing': instance.titleBottomSpacing,
      'bodyBottomSpacing': instance.bodyBottomSpacing,
      'primaryCtaBottomSpacing': instance.primaryCtaBottomSpacing,
      'crossAxisAlignment':
          _$IamCrossAxisAlignmentEnumMap[instance.crossAxisAlignment],
      'textAlign': _$IamTextAlignEnumMap[instance.textAlign],
      'scrollable': instance.scrollable,
      'backgroundColor': instance.backgroundColor,
      'titleStyle': instance.titleStyle,
      'bodyStyle': instance.bodyStyle,
      'imageFit': _$IamBoxFitEnumMap[instance.imageFit],
      'imageHeight': instance.imageHeight,
      'imageWidth': instance.imageWidth,
      'imageBorderRadius': instance.imageBorderRadius,
      'showCloseButton': instance.showCloseButton,
      'closeIconColor': instance.closeIconColor,
      'closeButtonBackgroundColor': instance.closeButtonBackgroundColor,
      'closeButtonAlignment': instance.closeButtonAlignment,
      'closeButtonTooltip': instance.closeButtonTooltip,
      'primaryCtaStyle': instance.primaryCtaStyle,
      'secondaryCtaStyle': instance.secondaryCtaStyle,
      'ctaMinimumSize': instance.ctaMinimumSize,
      'ctaBorderRadius': instance.ctaBorderRadius,
    };

const _$IamCrossAxisAlignmentEnumMap = {
  IamCrossAxisAlignment.start: 'start',
  IamCrossAxisAlignment.end: 'end',
  IamCrossAxisAlignment.center: 'center',
  IamCrossAxisAlignment.stretch: 'stretch',
  IamCrossAxisAlignment.baseline: 'baseline',
};

const _$IamTextAlignEnumMap = {
  IamTextAlign.left: 'left',
  IamTextAlign.right: 'right',
  IamTextAlign.center: 'center',
  IamTextAlign.justify: 'justify',
  IamTextAlign.start: 'start',
  IamTextAlign.end: 'end',
};

const _$IamBoxFitEnumMap = {
  IamBoxFit.fill: 'fill',
  IamBoxFit.contain: 'contain',
  IamBoxFit.cover: 'cover',
  IamBoxFit.fitWidth: 'fit_width',
  IamBoxFit.fitHeight: 'fit_height',
  IamBoxFit.none: 'none',
  IamBoxFit.scaleDown: 'scale_down',
};
