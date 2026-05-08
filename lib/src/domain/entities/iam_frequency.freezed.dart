// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iam_frequency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IamFrequency {

 int? get maxImpressions; IamDismissBehavior get dismissBehavior;
/// Create a copy of IamFrequency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamFrequencyCopyWith<IamFrequency> get copyWith => _$IamFrequencyCopyWithImpl<IamFrequency>(this as IamFrequency, _$identity);

  /// Serializes this IamFrequency to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamFrequency&&(identical(other.maxImpressions, maxImpressions) || other.maxImpressions == maxImpressions)&&(identical(other.dismissBehavior, dismissBehavior) || other.dismissBehavior == dismissBehavior));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxImpressions,dismissBehavior);

@override
String toString() {
  return 'IamFrequency(maxImpressions: $maxImpressions, dismissBehavior: $dismissBehavior)';
}


}

/// @nodoc
abstract mixin class $IamFrequencyCopyWith<$Res>  {
  factory $IamFrequencyCopyWith(IamFrequency value, $Res Function(IamFrequency) _then) = _$IamFrequencyCopyWithImpl;
@useResult
$Res call({
 int? maxImpressions, IamDismissBehavior dismissBehavior
});




}
/// @nodoc
class _$IamFrequencyCopyWithImpl<$Res>
    implements $IamFrequencyCopyWith<$Res> {
  _$IamFrequencyCopyWithImpl(this._self, this._then);

  final IamFrequency _self;
  final $Res Function(IamFrequency) _then;

/// Create a copy of IamFrequency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxImpressions = freezed,Object? dismissBehavior = null,}) {
  return _then(_self.copyWith(
maxImpressions: freezed == maxImpressions ? _self.maxImpressions : maxImpressions // ignore: cast_nullable_to_non_nullable
as int?,dismissBehavior: null == dismissBehavior ? _self.dismissBehavior : dismissBehavior // ignore: cast_nullable_to_non_nullable
as IamDismissBehavior,
  ));
}

}


/// Adds pattern-matching-related methods to [IamFrequency].
extension IamFrequencyPatterns on IamFrequency {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamFrequency value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamFrequency() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamFrequency value)  $default,){
final _that = this;
switch (_that) {
case _IamFrequency():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamFrequency value)?  $default,){
final _that = this;
switch (_that) {
case _IamFrequency() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? maxImpressions,  IamDismissBehavior dismissBehavior)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamFrequency() when $default != null:
return $default(_that.maxImpressions,_that.dismissBehavior);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? maxImpressions,  IamDismissBehavior dismissBehavior)  $default,) {final _that = this;
switch (_that) {
case _IamFrequency():
return $default(_that.maxImpressions,_that.dismissBehavior);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? maxImpressions,  IamDismissBehavior dismissBehavior)?  $default,) {final _that = this;
switch (_that) {
case _IamFrequency() when $default != null:
return $default(_that.maxImpressions,_that.dismissBehavior);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamFrequency implements IamFrequency {
  const _IamFrequency({this.maxImpressions, this.dismissBehavior = IamDismissBehavior.doNotShowAgain});
  factory _IamFrequency.fromJson(Map<String, dynamic> json) => _$IamFrequencyFromJson(json);

@override final  int? maxImpressions;
@override@JsonKey() final  IamDismissBehavior dismissBehavior;

/// Create a copy of IamFrequency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamFrequencyCopyWith<_IamFrequency> get copyWith => __$IamFrequencyCopyWithImpl<_IamFrequency>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamFrequencyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamFrequency&&(identical(other.maxImpressions, maxImpressions) || other.maxImpressions == maxImpressions)&&(identical(other.dismissBehavior, dismissBehavior) || other.dismissBehavior == dismissBehavior));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maxImpressions,dismissBehavior);

@override
String toString() {
  return 'IamFrequency(maxImpressions: $maxImpressions, dismissBehavior: $dismissBehavior)';
}


}

/// @nodoc
abstract mixin class _$IamFrequencyCopyWith<$Res> implements $IamFrequencyCopyWith<$Res> {
  factory _$IamFrequencyCopyWith(_IamFrequency value, $Res Function(_IamFrequency) _then) = __$IamFrequencyCopyWithImpl;
@override @useResult
$Res call({
 int? maxImpressions, IamDismissBehavior dismissBehavior
});




}
/// @nodoc
class __$IamFrequencyCopyWithImpl<$Res>
    implements _$IamFrequencyCopyWith<$Res> {
  __$IamFrequencyCopyWithImpl(this._self, this._then);

  final _IamFrequency _self;
  final $Res Function(_IamFrequency) _then;

/// Create a copy of IamFrequency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxImpressions = freezed,Object? dismissBehavior = null,}) {
  return _then(_IamFrequency(
maxImpressions: freezed == maxImpressions ? _self.maxImpressions : maxImpressions // ignore: cast_nullable_to_non_nullable
as int?,dismissBehavior: null == dismissBehavior ? _self.dismissBehavior : dismissBehavior // ignore: cast_nullable_to_non_nullable
as IamDismissBehavior,
  ));
}


}

// dart format on
