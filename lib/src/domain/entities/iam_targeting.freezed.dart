// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iam_targeting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IamTargeting {

 List<String> get platforms; List<String> get envs; String? get minAppVersion; String? get maxAppVersion; List<String> get organizations; List<String> get excludeOrganizations; List<String> get roles; List<String> get allowUserIds; List<String> get denyUserIds;
/// Create a copy of IamTargeting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamTargetingCopyWith<IamTargeting> get copyWith => _$IamTargetingCopyWithImpl<IamTargeting>(this as IamTargeting, _$identity);

  /// Serializes this IamTargeting to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamTargeting&&const DeepCollectionEquality().equals(other.platforms, platforms)&&const DeepCollectionEquality().equals(other.envs, envs)&&(identical(other.minAppVersion, minAppVersion) || other.minAppVersion == minAppVersion)&&(identical(other.maxAppVersion, maxAppVersion) || other.maxAppVersion == maxAppVersion)&&const DeepCollectionEquality().equals(other.organizations, organizations)&&const DeepCollectionEquality().equals(other.excludeOrganizations, excludeOrganizations)&&const DeepCollectionEquality().equals(other.roles, roles)&&const DeepCollectionEquality().equals(other.allowUserIds, allowUserIds)&&const DeepCollectionEquality().equals(other.denyUserIds, denyUserIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(platforms),const DeepCollectionEquality().hash(envs),minAppVersion,maxAppVersion,const DeepCollectionEquality().hash(organizations),const DeepCollectionEquality().hash(excludeOrganizations),const DeepCollectionEquality().hash(roles),const DeepCollectionEquality().hash(allowUserIds),const DeepCollectionEquality().hash(denyUserIds));

@override
String toString() {
  return 'IamTargeting(platforms: $platforms, envs: $envs, minAppVersion: $minAppVersion, maxAppVersion: $maxAppVersion, organizations: $organizations, excludeOrganizations: $excludeOrganizations, roles: $roles, allowUserIds: $allowUserIds, denyUserIds: $denyUserIds)';
}


}

/// @nodoc
abstract mixin class $IamTargetingCopyWith<$Res>  {
  factory $IamTargetingCopyWith(IamTargeting value, $Res Function(IamTargeting) _then) = _$IamTargetingCopyWithImpl;
@useResult
$Res call({
 List<String> platforms, List<String> envs, String? minAppVersion, String? maxAppVersion, List<String> organizations, List<String> excludeOrganizations, List<String> roles, List<String> allowUserIds, List<String> denyUserIds
});




}
/// @nodoc
class _$IamTargetingCopyWithImpl<$Res>
    implements $IamTargetingCopyWith<$Res> {
  _$IamTargetingCopyWithImpl(this._self, this._then);

  final IamTargeting _self;
  final $Res Function(IamTargeting) _then;

/// Create a copy of IamTargeting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platforms = null,Object? envs = null,Object? minAppVersion = freezed,Object? maxAppVersion = freezed,Object? organizations = null,Object? excludeOrganizations = null,Object? roles = null,Object? allowUserIds = null,Object? denyUserIds = null,}) {
  return _then(_self.copyWith(
platforms: null == platforms ? _self.platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<String>,envs: null == envs ? _self.envs : envs // ignore: cast_nullable_to_non_nullable
as List<String>,minAppVersion: freezed == minAppVersion ? _self.minAppVersion : minAppVersion // ignore: cast_nullable_to_non_nullable
as String?,maxAppVersion: freezed == maxAppVersion ? _self.maxAppVersion : maxAppVersion // ignore: cast_nullable_to_non_nullable
as String?,organizations: null == organizations ? _self.organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<String>,excludeOrganizations: null == excludeOrganizations ? _self.excludeOrganizations : excludeOrganizations // ignore: cast_nullable_to_non_nullable
as List<String>,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,allowUserIds: null == allowUserIds ? _self.allowUserIds : allowUserIds // ignore: cast_nullable_to_non_nullable
as List<String>,denyUserIds: null == denyUserIds ? _self.denyUserIds : denyUserIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [IamTargeting].
extension IamTargetingPatterns on IamTargeting {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamTargeting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamTargeting() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamTargeting value)  $default,){
final _that = this;
switch (_that) {
case _IamTargeting():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamTargeting value)?  $default,){
final _that = this;
switch (_that) {
case _IamTargeting() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> platforms,  List<String> envs,  String? minAppVersion,  String? maxAppVersion,  List<String> organizations,  List<String> excludeOrganizations,  List<String> roles,  List<String> allowUserIds,  List<String> denyUserIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamTargeting() when $default != null:
return $default(_that.platforms,_that.envs,_that.minAppVersion,_that.maxAppVersion,_that.organizations,_that.excludeOrganizations,_that.roles,_that.allowUserIds,_that.denyUserIds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> platforms,  List<String> envs,  String? minAppVersion,  String? maxAppVersion,  List<String> organizations,  List<String> excludeOrganizations,  List<String> roles,  List<String> allowUserIds,  List<String> denyUserIds)  $default,) {final _that = this;
switch (_that) {
case _IamTargeting():
return $default(_that.platforms,_that.envs,_that.minAppVersion,_that.maxAppVersion,_that.organizations,_that.excludeOrganizations,_that.roles,_that.allowUserIds,_that.denyUserIds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> platforms,  List<String> envs,  String? minAppVersion,  String? maxAppVersion,  List<String> organizations,  List<String> excludeOrganizations,  List<String> roles,  List<String> allowUserIds,  List<String> denyUserIds)?  $default,) {final _that = this;
switch (_that) {
case _IamTargeting() when $default != null:
return $default(_that.platforms,_that.envs,_that.minAppVersion,_that.maxAppVersion,_that.organizations,_that.excludeOrganizations,_that.roles,_that.allowUserIds,_that.denyUserIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamTargeting implements IamTargeting {
  const _IamTargeting({final  List<String> platforms = const <String>[], final  List<String> envs = const <String>[], this.minAppVersion, this.maxAppVersion, final  List<String> organizations = const <String>[], final  List<String> excludeOrganizations = const <String>[], final  List<String> roles = const <String>[], final  List<String> allowUserIds = const <String>[], final  List<String> denyUserIds = const <String>[]}): _platforms = platforms,_envs = envs,_organizations = organizations,_excludeOrganizations = excludeOrganizations,_roles = roles,_allowUserIds = allowUserIds,_denyUserIds = denyUserIds;
  factory _IamTargeting.fromJson(Map<String, dynamic> json) => _$IamTargetingFromJson(json);

 final  List<String> _platforms;
@override@JsonKey() List<String> get platforms {
  if (_platforms is EqualUnmodifiableListView) return _platforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_platforms);
}

 final  List<String> _envs;
@override@JsonKey() List<String> get envs {
  if (_envs is EqualUnmodifiableListView) return _envs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_envs);
}

@override final  String? minAppVersion;
@override final  String? maxAppVersion;
 final  List<String> _organizations;
@override@JsonKey() List<String> get organizations {
  if (_organizations is EqualUnmodifiableListView) return _organizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_organizations);
}

 final  List<String> _excludeOrganizations;
@override@JsonKey() List<String> get excludeOrganizations {
  if (_excludeOrganizations is EqualUnmodifiableListView) return _excludeOrganizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_excludeOrganizations);
}

 final  List<String> _roles;
@override@JsonKey() List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

 final  List<String> _allowUserIds;
@override@JsonKey() List<String> get allowUserIds {
  if (_allowUserIds is EqualUnmodifiableListView) return _allowUserIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowUserIds);
}

 final  List<String> _denyUserIds;
@override@JsonKey() List<String> get denyUserIds {
  if (_denyUserIds is EqualUnmodifiableListView) return _denyUserIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_denyUserIds);
}


/// Create a copy of IamTargeting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamTargetingCopyWith<_IamTargeting> get copyWith => __$IamTargetingCopyWithImpl<_IamTargeting>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamTargetingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamTargeting&&const DeepCollectionEquality().equals(other._platforms, _platforms)&&const DeepCollectionEquality().equals(other._envs, _envs)&&(identical(other.minAppVersion, minAppVersion) || other.minAppVersion == minAppVersion)&&(identical(other.maxAppVersion, maxAppVersion) || other.maxAppVersion == maxAppVersion)&&const DeepCollectionEquality().equals(other._organizations, _organizations)&&const DeepCollectionEquality().equals(other._excludeOrganizations, _excludeOrganizations)&&const DeepCollectionEquality().equals(other._roles, _roles)&&const DeepCollectionEquality().equals(other._allowUserIds, _allowUserIds)&&const DeepCollectionEquality().equals(other._denyUserIds, _denyUserIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_platforms),const DeepCollectionEquality().hash(_envs),minAppVersion,maxAppVersion,const DeepCollectionEquality().hash(_organizations),const DeepCollectionEquality().hash(_excludeOrganizations),const DeepCollectionEquality().hash(_roles),const DeepCollectionEquality().hash(_allowUserIds),const DeepCollectionEquality().hash(_denyUserIds));

@override
String toString() {
  return 'IamTargeting(platforms: $platforms, envs: $envs, minAppVersion: $minAppVersion, maxAppVersion: $maxAppVersion, organizations: $organizations, excludeOrganizations: $excludeOrganizations, roles: $roles, allowUserIds: $allowUserIds, denyUserIds: $denyUserIds)';
}


}

/// @nodoc
abstract mixin class _$IamTargetingCopyWith<$Res> implements $IamTargetingCopyWith<$Res> {
  factory _$IamTargetingCopyWith(_IamTargeting value, $Res Function(_IamTargeting) _then) = __$IamTargetingCopyWithImpl;
@override @useResult
$Res call({
 List<String> platforms, List<String> envs, String? minAppVersion, String? maxAppVersion, List<String> organizations, List<String> excludeOrganizations, List<String> roles, List<String> allowUserIds, List<String> denyUserIds
});




}
/// @nodoc
class __$IamTargetingCopyWithImpl<$Res>
    implements _$IamTargetingCopyWith<$Res> {
  __$IamTargetingCopyWithImpl(this._self, this._then);

  final _IamTargeting _self;
  final $Res Function(_IamTargeting) _then;

/// Create a copy of IamTargeting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platforms = null,Object? envs = null,Object? minAppVersion = freezed,Object? maxAppVersion = freezed,Object? organizations = null,Object? excludeOrganizations = null,Object? roles = null,Object? allowUserIds = null,Object? denyUserIds = null,}) {
  return _then(_IamTargeting(
platforms: null == platforms ? _self._platforms : platforms // ignore: cast_nullable_to_non_nullable
as List<String>,envs: null == envs ? _self._envs : envs // ignore: cast_nullable_to_non_nullable
as List<String>,minAppVersion: freezed == minAppVersion ? _self.minAppVersion : minAppVersion // ignore: cast_nullable_to_non_nullable
as String?,maxAppVersion: freezed == maxAppVersion ? _self.maxAppVersion : maxAppVersion // ignore: cast_nullable_to_non_nullable
as String?,organizations: null == organizations ? _self._organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<String>,excludeOrganizations: null == excludeOrganizations ? _self._excludeOrganizations : excludeOrganizations // ignore: cast_nullable_to_non_nullable
as List<String>,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,allowUserIds: null == allowUserIds ? _self._allowUserIds : allowUserIds // ignore: cast_nullable_to_non_nullable
as List<String>,denyUserIds: null == denyUserIds ? _self._denyUserIds : denyUserIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
