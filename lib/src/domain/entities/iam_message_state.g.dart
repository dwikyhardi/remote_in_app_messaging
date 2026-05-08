// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iam_message_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IamMessageState _$IamMessageStateFromJson(Map<String, dynamic> json) =>
    _IamMessageState(
      impressions: (json['impressions'] as num?)?.toInt() ?? 0,
      lastShownAt: json['lastShownAt'] == null
          ? null
          : DateTime.parse(json['lastShownAt'] as String),
      dismissed: json['dismissed'] as bool? ?? false,
      ctaClicked: json['ctaClicked'] as bool? ?? false,
      stickyVariantIndex: (json['stickyVariantIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$IamMessageStateToJson(_IamMessageState instance) =>
    <String, dynamic>{
      'impressions': instance.impressions,
      'lastShownAt': instance.lastShownAt?.toIso8601String(),
      'dismissed': instance.dismissed,
      'ctaClicked': instance.ctaClicked,
      'stickyVariantIndex': instance.stickyVariantIndex,
    };
