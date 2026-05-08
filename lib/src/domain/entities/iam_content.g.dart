// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iam_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IamContent _$IamContentFromJson(Map<String, dynamic> json) => _IamContent(
  title: json['title'] as String? ?? '',
  body: json['body'] as String? ?? '',
  imageUrl: json['imageUrl'] as String?,
  primaryCta: json['primaryCta'] == null
      ? null
      : IamCta.fromJson(json['primaryCta'] as Map<String, dynamic>),
  secondaryCta: json['secondaryCta'] == null
      ? null
      : IamCta.fromJson(json['secondaryCta'] as Map<String, dynamic>),
  backgroundColor: json['backgroundColor'] as String?,
  textColor: json['textColor'] as String?,
  style: json['style'] == null
      ? null
      : IamBodyStyle.fromJson(json['style'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IamContentToJson(_IamContent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'imageUrl': instance.imageUrl,
      'primaryCta': instance.primaryCta,
      'secondaryCta': instance.secondaryCta,
      'backgroundColor': instance.backgroundColor,
      'textColor': instance.textColor,
      'style': instance.style,
    };
