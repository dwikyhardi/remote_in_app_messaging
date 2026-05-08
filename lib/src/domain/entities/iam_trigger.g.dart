// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iam_trigger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IamTrigger _$IamTriggerFromJson(Map<String, dynamic> json) => _IamTrigger(
  type:
      $enumDecodeNullable(_$IamTriggerTypeEnumMap, json['type']) ??
      IamTriggerType.onLaunch,
  routePath: json['routePath'] as String?,
  eventName: json['eventName'] as String?,
  eventParamsMatch:
      json['eventParamsMatch'] as Map<String, dynamic>? ??
      const <String, dynamic>{},
  delayMs: (json['delayMs'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$IamTriggerToJson(_IamTrigger instance) =>
    <String, dynamic>{
      'type': _$IamTriggerTypeEnumMap[instance.type]!,
      'routePath': instance.routePath,
      'eventName': instance.eventName,
      'eventParamsMatch': instance.eventParamsMatch,
      'delayMs': instance.delayMs,
    };

const _$IamTriggerTypeEnumMap = {
  IamTriggerType.onLaunch: 'on_launch',
  IamTriggerType.onRoute: 'on_route',
  IamTriggerType.onEvent: 'on_event',
};
