// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InAppMessage _$InAppMessageFromJson(Map<String, dynamic> json) =>
    _InAppMessage(
      id: json['id'] as String,
      enabled: json['enabled'] as bool? ?? true,
      layout:
          $enumDecodeNullable(_$IamLayoutEnumMap, json['layout']) ??
          IamLayout.modal,
      startAt: json['startAt'] == null
          ? null
          : DateTime.parse(json['startAt'] as String),
      endAt: json['endAt'] == null
          ? null
          : DateTime.parse(json['endAt'] as String),
      trigger: json['trigger'] == null
          ? const IamTrigger()
          : IamTrigger.fromJson(json['trigger'] as Map<String, dynamic>),
      targeting: json['targeting'] == null
          ? const IamTargeting()
          : IamTargeting.fromJson(json['targeting'] as Map<String, dynamic>),
      frequency: json['frequency'] == null
          ? const IamFrequency()
          : IamFrequency.fromJson(json['frequency'] as Map<String, dynamic>),
      variants:
          (json['variants'] as List<dynamic>?)
              ?.map((e) => IamVariant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <IamVariant>[],
      showCloseButton: json['showCloseButton'] as bool? ?? true,
    );

Map<String, dynamic> _$InAppMessageToJson(_InAppMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enabled': instance.enabled,
      'layout': _$IamLayoutEnumMap[instance.layout]!,
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
      'trigger': instance.trigger,
      'targeting': instance.targeting,
      'frequency': instance.frequency,
      'variants': instance.variants,
      'showCloseButton': instance.showCloseButton,
    };

const _$IamLayoutEnumMap = {
  IamLayout.modal: 'modal',
  IamLayout.bottomSheet: 'bottom_sheet',
  IamLayout.fullscreen: 'fullscreen',
  IamLayout.imageOnlyModal: 'image_only_modal',
};
