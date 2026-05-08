// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iam_frequency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IamFrequency _$IamFrequencyFromJson(Map<String, dynamic> json) =>
    _IamFrequency(
      maxImpressions: (json['maxImpressions'] as num?)?.toInt(),
      dismissBehavior:
          $enumDecodeNullable(
            _$IamDismissBehaviorEnumMap,
            json['dismissBehavior'],
          ) ??
          IamDismissBehavior.doNotShowAgain,
    );

Map<String, dynamic> _$IamFrequencyToJson(_IamFrequency instance) =>
    <String, dynamic>{
      'maxImpressions': instance.maxImpressions,
      'dismissBehavior': _$IamDismissBehaviorEnumMap[instance.dismissBehavior]!,
    };

const _$IamDismissBehaviorEnumMap = {
  IamDismissBehavior.doNotShowAgain: 'do_not_show_again',
  IamDismissBehavior.allowRetry: 'allow_retry',
};
