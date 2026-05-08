// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iam_user_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IamUserContext {

 String get userId; String get platform;// 'android' | 'ios'
 String get env;// 'production' | 'development' | ...
 String get appVersion; String? get organizationId; List<String> get roles;
/// Create a copy of IamUserContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamUserContextCopyWith<IamUserContext> get copyWith => _$IamUserContextCopyWithImpl<IamUserContext>(this as IamUserContext, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamUserContext&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.env, env) || other.env == env)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&const DeepCollectionEquality().equals(other.roles, roles));
}


@override
int get hashCode => Object.hash(runtimeType,userId,platform,env,appVersion,organizationId,const DeepCollectionEquality().hash(roles));

@override
String toString() {
  return 'IamUserContext(userId: $userId, platform: $platform, env: $env, appVersion: $appVersion, organizationId: $organizationId, roles: $roles)';
}


}

/// @nodoc
abstract mixin class $IamUserContextCopyWith<$Res>  {
  factory $IamUserContextCopyWith(IamUserContext value, $Res Function(IamUserContext) _then) = _$IamUserContextCopyWithImpl;
@useResult
$Res call({
 String userId, String platform, String env, String appVersion, String? organizationId, List<String> roles
});




}
/// @nodoc
class _$IamUserContextCopyWithImpl<$Res>
    implements $IamUserContextCopyWith<$Res> {
  _$IamUserContextCopyWithImpl(this._self, this._then);

  final IamUserContext _self;
  final $Res Function(IamUserContext) _then;

/// Create a copy of IamUserContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? platform = null,Object? env = null,Object? appVersion = null,Object? organizationId = freezed,Object? roles = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,env: null == env ? _self.env : env // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [IamUserContext].
extension IamUserContextPatterns on IamUserContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamUserContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamUserContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamUserContext value)  $default,){
final _that = this;
switch (_that) {
case _IamUserContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamUserContext value)?  $default,){
final _that = this;
switch (_that) {
case _IamUserContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String platform,  String env,  String appVersion,  String? organizationId,  List<String> roles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamUserContext() when $default != null:
return $default(_that.userId,_that.platform,_that.env,_that.appVersion,_that.organizationId,_that.roles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String platform,  String env,  String appVersion,  String? organizationId,  List<String> roles)  $default,) {final _that = this;
switch (_that) {
case _IamUserContext():
return $default(_that.userId,_that.platform,_that.env,_that.appVersion,_that.organizationId,_that.roles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String platform,  String env,  String appVersion,  String? organizationId,  List<String> roles)?  $default,) {final _that = this;
switch (_that) {
case _IamUserContext() when $default != null:
return $default(_that.userId,_that.platform,_that.env,_that.appVersion,_that.organizationId,_that.roles);case _:
  return null;

}
}

}

/// @nodoc


class _IamUserContext implements IamUserContext {
  const _IamUserContext({this.userId = '', this.platform = '', this.env = '', this.appVersion = '0.0.0', this.organizationId, final  List<String> roles = const <String>[]}): _roles = roles;
  

@override@JsonKey() final  String userId;
@override@JsonKey() final  String platform;
// 'android' | 'ios'
@override@JsonKey() final  String env;
// 'production' | 'development' | ...
@override@JsonKey() final  String appVersion;
@override final  String? organizationId;
 final  List<String> _roles;
@override@JsonKey() List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of IamUserContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamUserContextCopyWith<_IamUserContext> get copyWith => __$IamUserContextCopyWithImpl<_IamUserContext>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamUserContext&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.env, env) || other.env == env)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&const DeepCollectionEquality().equals(other._roles, _roles));
}


@override
int get hashCode => Object.hash(runtimeType,userId,platform,env,appVersion,organizationId,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'IamUserContext(userId: $userId, platform: $platform, env: $env, appVersion: $appVersion, organizationId: $organizationId, roles: $roles)';
}


}

/// @nodoc
abstract mixin class _$IamUserContextCopyWith<$Res> implements $IamUserContextCopyWith<$Res> {
  factory _$IamUserContextCopyWith(_IamUserContext value, $Res Function(_IamUserContext) _then) = __$IamUserContextCopyWithImpl;
@override @useResult
$Res call({
 String userId, String platform, String env, String appVersion, String? organizationId, List<String> roles
});




}
/// @nodoc
class __$IamUserContextCopyWithImpl<$Res>
    implements _$IamUserContextCopyWith<$Res> {
  __$IamUserContextCopyWithImpl(this._self, this._then);

  final _IamUserContext _self;
  final $Res Function(_IamUserContext) _then;

/// Create a copy of IamUserContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? platform = null,Object? env = null,Object? appVersion = null,Object? organizationId = freezed,Object? roles = null,}) {
  return _then(_IamUserContext(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,env: null == env ? _self.env : env // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
