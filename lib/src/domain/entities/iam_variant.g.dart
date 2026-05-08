// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iam_variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IamVariant _$IamVariantFromJson(Map<String, dynamic> json) => _IamVariant(
  weight: (json['weight'] as num?)?.toInt() ?? 1,
  content: json['content'] == null
      ? const IamContent()
      : IamContent.fromJson(json['content'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IamVariantToJson(_IamVariant instance) =>
    <String, dynamic>{'weight': instance.weight, 'content': instance.content};
