// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iam_targeting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IamTargeting _$IamTargetingFromJson(Map<String, dynamic> json) =>
    _IamTargeting(
      platforms:
          (json['platforms'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      envs:
          (json['envs'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      minAppVersion: json['minAppVersion'] as String?,
      maxAppVersion: json['maxAppVersion'] as String?,
      organizations:
          (json['organizations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      excludeOrganizations:
          (json['excludeOrganizations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      allowUserIds:
          (json['allowUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      denyUserIds:
          (json['denyUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$IamTargetingToJson(_IamTargeting instance) =>
    <String, dynamic>{
      'platforms': instance.platforms,
      'envs': instance.envs,
      'minAppVersion': instance.minAppVersion,
      'maxAppVersion': instance.maxAppVersion,
      'organizations': instance.organizations,
      'excludeOrganizations': instance.excludeOrganizations,
      'roles': instance.roles,
      'allowUserIds': instance.allowUserIds,
      'denyUserIds': instance.denyUserIds,
    };
