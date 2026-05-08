// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iam_cta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IamCta _$IamCtaFromJson(Map<String, dynamic> json) => _IamCta(
  label: json['label'] as String? ?? '',
  action:
      $enumDecodeNullable(_$IamActionTypeEnumMap, json['action']) ??
      IamActionType.close,
  url: json['url'] as String?,
  style: json['style'] == null
      ? null
      : IamCtaButtonStyle.fromJson(json['style'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IamCtaToJson(_IamCta instance) => <String, dynamic>{
  'label': instance.label,
  'action': _$IamActionTypeEnumMap[instance.action]!,
  'url': instance.url,
  'style': instance.style,
};

const _$IamActionTypeEnumMap = {
  IamActionType.close: 'close',
  IamActionType.deepLink: 'deep_link',
  IamActionType.externalUrl: 'external_url',
};
