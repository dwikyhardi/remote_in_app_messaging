// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iam_trigger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IamTrigger {

 IamTriggerType get type; String? get routePath; String? get eventName; Map<String, dynamic> get eventParamsMatch; int get delayMs;
/// Create a copy of IamTrigger
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamTriggerCopyWith<IamTrigger> get copyWith => _$IamTriggerCopyWithImpl<IamTrigger>(this as IamTrigger, _$identity);

  /// Serializes this IamTrigger to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamTrigger&&(identical(other.type, type) || other.type == type)&&(identical(other.routePath, routePath) || other.routePath == routePath)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&const DeepCollectionEquality().equals(other.eventParamsMatch, eventParamsMatch)&&(identical(other.delayMs, delayMs) || other.delayMs == delayMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,routePath,eventName,const DeepCollectionEquality().hash(eventParamsMatch),delayMs);

@override
String toString() {
  return 'IamTrigger(type: $type, routePath: $routePath, eventName: $eventName, eventParamsMatch: $eventParamsMatch, delayMs: $delayMs)';
}


}

/// @nodoc
abstract mixin class $IamTriggerCopyWith<$Res>  {
  factory $IamTriggerCopyWith(IamTrigger value, $Res Function(IamTrigger) _then) = _$IamTriggerCopyWithImpl;
@useResult
$Res call({
 IamTriggerType type, String? routePath, String? eventName, Map<String, dynamic> eventParamsMatch, int delayMs
});




}
/// @nodoc
class _$IamTriggerCopyWithImpl<$Res>
    implements $IamTriggerCopyWith<$Res> {
  _$IamTriggerCopyWithImpl(this._self, this._then);

  final IamTrigger _self;
  final $Res Function(IamTrigger) _then;

/// Create a copy of IamTrigger
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? routePath = freezed,Object? eventName = freezed,Object? eventParamsMatch = null,Object? delayMs = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IamTriggerType,routePath: freezed == routePath ? _self.routePath : routePath // ignore: cast_nullable_to_non_nullable
as String?,eventName: freezed == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String?,eventParamsMatch: null == eventParamsMatch ? _self.eventParamsMatch : eventParamsMatch // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,delayMs: null == delayMs ? _self.delayMs : delayMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IamTrigger].
extension IamTriggerPatterns on IamTrigger {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamTrigger value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamTrigger() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamTrigger value)  $default,){
final _that = this;
switch (_that) {
case _IamTrigger():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamTrigger value)?  $default,){
final _that = this;
switch (_that) {
case _IamTrigger() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IamTriggerType type,  String? routePath,  String? eventName,  Map<String, dynamic> eventParamsMatch,  int delayMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamTrigger() when $default != null:
return $default(_that.type,_that.routePath,_that.eventName,_that.eventParamsMatch,_that.delayMs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IamTriggerType type,  String? routePath,  String? eventName,  Map<String, dynamic> eventParamsMatch,  int delayMs)  $default,) {final _that = this;
switch (_that) {
case _IamTrigger():
return $default(_that.type,_that.routePath,_that.eventName,_that.eventParamsMatch,_that.delayMs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IamTriggerType type,  String? routePath,  String? eventName,  Map<String, dynamic> eventParamsMatch,  int delayMs)?  $default,) {final _that = this;
switch (_that) {
case _IamTrigger() when $default != null:
return $default(_that.type,_that.routePath,_that.eventName,_that.eventParamsMatch,_that.delayMs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamTrigger implements IamTrigger {
  const _IamTrigger({this.type = IamTriggerType.onLaunch, this.routePath, this.eventName, final  Map<String, dynamic> eventParamsMatch = const <String, dynamic>{}, this.delayMs = 0}): _eventParamsMatch = eventParamsMatch;
  factory _IamTrigger.fromJson(Map<String, dynamic> json) => _$IamTriggerFromJson(json);

@override@JsonKey() final  IamTriggerType type;
@override final  String? routePath;
@override final  String? eventName;
 final  Map<String, dynamic> _eventParamsMatch;
@override@JsonKey() Map<String, dynamic> get eventParamsMatch {
  if (_eventParamsMatch is EqualUnmodifiableMapView) return _eventParamsMatch;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_eventParamsMatch);
}

@override@JsonKey() final  int delayMs;

/// Create a copy of IamTrigger
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamTriggerCopyWith<_IamTrigger> get copyWith => __$IamTriggerCopyWithImpl<_IamTrigger>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamTriggerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamTrigger&&(identical(other.type, type) || other.type == type)&&(identical(other.routePath, routePath) || other.routePath == routePath)&&(identical(other.eventName, eventName) || other.eventName == eventName)&&const DeepCollectionEquality().equals(other._eventParamsMatch, _eventParamsMatch)&&(identical(other.delayMs, delayMs) || other.delayMs == delayMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,routePath,eventName,const DeepCollectionEquality().hash(_eventParamsMatch),delayMs);

@override
String toString() {
  return 'IamTrigger(type: $type, routePath: $routePath, eventName: $eventName, eventParamsMatch: $eventParamsMatch, delayMs: $delayMs)';
}


}

/// @nodoc
abstract mixin class _$IamTriggerCopyWith<$Res> implements $IamTriggerCopyWith<$Res> {
  factory _$IamTriggerCopyWith(_IamTrigger value, $Res Function(_IamTrigger) _then) = __$IamTriggerCopyWithImpl;
@override @useResult
$Res call({
 IamTriggerType type, String? routePath, String? eventName, Map<String, dynamic> eventParamsMatch, int delayMs
});




}
/// @nodoc
class __$IamTriggerCopyWithImpl<$Res>
    implements _$IamTriggerCopyWith<$Res> {
  __$IamTriggerCopyWithImpl(this._self, this._then);

  final _IamTrigger _self;
  final $Res Function(_IamTrigger) _then;

/// Create a copy of IamTrigger
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? routePath = freezed,Object? eventName = freezed,Object? eventParamsMatch = null,Object? delayMs = null,}) {
  return _then(_IamTrigger(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IamTriggerType,routePath: freezed == routePath ? _self.routePath : routePath // ignore: cast_nullable_to_non_nullable
as String?,eventName: freezed == eventName ? _self.eventName : eventName // ignore: cast_nullable_to_non_nullable
as String?,eventParamsMatch: null == eventParamsMatch ? _self._eventParamsMatch : eventParamsMatch // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,delayMs: null == delayMs ? _self.delayMs : delayMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
