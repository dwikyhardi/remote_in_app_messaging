// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iam_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IamVariant {

 int get weight; IamContent get content;
/// Create a copy of IamVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamVariantCopyWith<IamVariant> get copyWith => _$IamVariantCopyWithImpl<IamVariant>(this as IamVariant, _$identity);

  /// Serializes this IamVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamVariant&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weight,content);

@override
String toString() {
  return 'IamVariant(weight: $weight, content: $content)';
}


}

/// @nodoc
abstract mixin class $IamVariantCopyWith<$Res>  {
  factory $IamVariantCopyWith(IamVariant value, $Res Function(IamVariant) _then) = _$IamVariantCopyWithImpl;
@useResult
$Res call({
 int weight, IamContent content
});


$IamContentCopyWith<$Res> get content;

}
/// @nodoc
class _$IamVariantCopyWithImpl<$Res>
    implements $IamVariantCopyWith<$Res> {
  _$IamVariantCopyWithImpl(this._self, this._then);

  final IamVariant _self;
  final $Res Function(IamVariant) _then;

/// Create a copy of IamVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weight = null,Object? content = null,}) {
  return _then(_self.copyWith(
weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as IamContent,
  ));
}
/// Create a copy of IamVariant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamContentCopyWith<$Res> get content {
  
  return $IamContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// Adds pattern-matching-related methods to [IamVariant].
extension IamVariantPatterns on IamVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamVariant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamVariant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamVariant value)  $default,){
final _that = this;
switch (_that) {
case _IamVariant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamVariant value)?  $default,){
final _that = this;
switch (_that) {
case _IamVariant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int weight,  IamContent content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamVariant() when $default != null:
return $default(_that.weight,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int weight,  IamContent content)  $default,) {final _that = this;
switch (_that) {
case _IamVariant():
return $default(_that.weight,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int weight,  IamContent content)?  $default,) {final _that = this;
switch (_that) {
case _IamVariant() when $default != null:
return $default(_that.weight,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamVariant implements IamVariant {
  const _IamVariant({this.weight = 1, this.content = const IamContent()});
  factory _IamVariant.fromJson(Map<String, dynamic> json) => _$IamVariantFromJson(json);

@override@JsonKey() final  int weight;
@override@JsonKey() final  IamContent content;

/// Create a copy of IamVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamVariantCopyWith<_IamVariant> get copyWith => __$IamVariantCopyWithImpl<_IamVariant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamVariantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamVariant&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weight,content);

@override
String toString() {
  return 'IamVariant(weight: $weight, content: $content)';
}


}

/// @nodoc
abstract mixin class _$IamVariantCopyWith<$Res> implements $IamVariantCopyWith<$Res> {
  factory _$IamVariantCopyWith(_IamVariant value, $Res Function(_IamVariant) _then) = __$IamVariantCopyWithImpl;
@override @useResult
$Res call({
 int weight, IamContent content
});


@override $IamContentCopyWith<$Res> get content;

}
/// @nodoc
class __$IamVariantCopyWithImpl<$Res>
    implements _$IamVariantCopyWith<$Res> {
  __$IamVariantCopyWithImpl(this._self, this._then);

  final _IamVariant _self;
  final $Res Function(_IamVariant) _then;

/// Create a copy of IamVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weight = null,Object? content = null,}) {
  return _then(_IamVariant(
weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as IamContent,
  ));
}

/// Create a copy of IamVariant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamContentCopyWith<$Res> get content {
  
  return $IamContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}

// dart format on
