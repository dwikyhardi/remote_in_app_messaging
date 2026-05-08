// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iam_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IamEdgeInsets {

 double? get all; double? get horizontal; double? get vertical; double? get left; double? get top; double? get right; double? get bottom;
/// Create a copy of IamEdgeInsets
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamEdgeInsetsCopyWith<IamEdgeInsets> get copyWith => _$IamEdgeInsetsCopyWithImpl<IamEdgeInsets>(this as IamEdgeInsets, _$identity);

  /// Serializes this IamEdgeInsets to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamEdgeInsets&&(identical(other.all, all) || other.all == all)&&(identical(other.horizontal, horizontal) || other.horizontal == horizontal)&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.left, left) || other.left == left)&&(identical(other.top, top) || other.top == top)&&(identical(other.right, right) || other.right == right)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,all,horizontal,vertical,left,top,right,bottom);

@override
String toString() {
  return 'IamEdgeInsets(all: $all, horizontal: $horizontal, vertical: $vertical, left: $left, top: $top, right: $right, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class $IamEdgeInsetsCopyWith<$Res>  {
  factory $IamEdgeInsetsCopyWith(IamEdgeInsets value, $Res Function(IamEdgeInsets) _then) = _$IamEdgeInsetsCopyWithImpl;
@useResult
$Res call({
 double? all, double? horizontal, double? vertical, double? left, double? top, double? right, double? bottom
});




}
/// @nodoc
class _$IamEdgeInsetsCopyWithImpl<$Res>
    implements $IamEdgeInsetsCopyWith<$Res> {
  _$IamEdgeInsetsCopyWithImpl(this._self, this._then);

  final IamEdgeInsets _self;
  final $Res Function(IamEdgeInsets) _then;

/// Create a copy of IamEdgeInsets
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? all = freezed,Object? horizontal = freezed,Object? vertical = freezed,Object? left = freezed,Object? top = freezed,Object? right = freezed,Object? bottom = freezed,}) {
  return _then(_self.copyWith(
all: freezed == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as double?,horizontal: freezed == horizontal ? _self.horizontal : horizontal // ignore: cast_nullable_to_non_nullable
as double?,vertical: freezed == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as double?,left: freezed == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as double?,top: freezed == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double?,right: freezed == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as double?,bottom: freezed == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [IamEdgeInsets].
extension IamEdgeInsetsPatterns on IamEdgeInsets {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamEdgeInsets value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamEdgeInsets() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamEdgeInsets value)  $default,){
final _that = this;
switch (_that) {
case _IamEdgeInsets():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamEdgeInsets value)?  $default,){
final _that = this;
switch (_that) {
case _IamEdgeInsets() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? all,  double? horizontal,  double? vertical,  double? left,  double? top,  double? right,  double? bottom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamEdgeInsets() when $default != null:
return $default(_that.all,_that.horizontal,_that.vertical,_that.left,_that.top,_that.right,_that.bottom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? all,  double? horizontal,  double? vertical,  double? left,  double? top,  double? right,  double? bottom)  $default,) {final _that = this;
switch (_that) {
case _IamEdgeInsets():
return $default(_that.all,_that.horizontal,_that.vertical,_that.left,_that.top,_that.right,_that.bottom);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? all,  double? horizontal,  double? vertical,  double? left,  double? top,  double? right,  double? bottom)?  $default,) {final _that = this;
switch (_that) {
case _IamEdgeInsets() when $default != null:
return $default(_that.all,_that.horizontal,_that.vertical,_that.left,_that.top,_that.right,_that.bottom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamEdgeInsets implements IamEdgeInsets {
  const _IamEdgeInsets({this.all, this.horizontal, this.vertical, this.left, this.top, this.right, this.bottom});
  factory _IamEdgeInsets.fromJson(Map<String, dynamic> json) => _$IamEdgeInsetsFromJson(json);

@override final  double? all;
@override final  double? horizontal;
@override final  double? vertical;
@override final  double? left;
@override final  double? top;
@override final  double? right;
@override final  double? bottom;

/// Create a copy of IamEdgeInsets
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamEdgeInsetsCopyWith<_IamEdgeInsets> get copyWith => __$IamEdgeInsetsCopyWithImpl<_IamEdgeInsets>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamEdgeInsetsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamEdgeInsets&&(identical(other.all, all) || other.all == all)&&(identical(other.horizontal, horizontal) || other.horizontal == horizontal)&&(identical(other.vertical, vertical) || other.vertical == vertical)&&(identical(other.left, left) || other.left == left)&&(identical(other.top, top) || other.top == top)&&(identical(other.right, right) || other.right == right)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,all,horizontal,vertical,left,top,right,bottom);

@override
String toString() {
  return 'IamEdgeInsets(all: $all, horizontal: $horizontal, vertical: $vertical, left: $left, top: $top, right: $right, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class _$IamEdgeInsetsCopyWith<$Res> implements $IamEdgeInsetsCopyWith<$Res> {
  factory _$IamEdgeInsetsCopyWith(_IamEdgeInsets value, $Res Function(_IamEdgeInsets) _then) = __$IamEdgeInsetsCopyWithImpl;
@override @useResult
$Res call({
 double? all, double? horizontal, double? vertical, double? left, double? top, double? right, double? bottom
});




}
/// @nodoc
class __$IamEdgeInsetsCopyWithImpl<$Res>
    implements _$IamEdgeInsetsCopyWith<$Res> {
  __$IamEdgeInsetsCopyWithImpl(this._self, this._then);

  final _IamEdgeInsets _self;
  final $Res Function(_IamEdgeInsets) _then;

/// Create a copy of IamEdgeInsets
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? all = freezed,Object? horizontal = freezed,Object? vertical = freezed,Object? left = freezed,Object? top = freezed,Object? right = freezed,Object? bottom = freezed,}) {
  return _then(_IamEdgeInsets(
all: freezed == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as double?,horizontal: freezed == horizontal ? _self.horizontal : horizontal // ignore: cast_nullable_to_non_nullable
as double?,vertical: freezed == vertical ? _self.vertical : vertical // ignore: cast_nullable_to_non_nullable
as double?,left: freezed == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as double?,top: freezed == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double?,right: freezed == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as double?,bottom: freezed == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$IamSize {

 double? get width; double? get height;
/// Create a copy of IamSize
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamSizeCopyWith<IamSize> get copyWith => _$IamSizeCopyWithImpl<IamSize>(this as IamSize, _$identity);

  /// Serializes this IamSize to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamSize&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height);

@override
String toString() {
  return 'IamSize(width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class $IamSizeCopyWith<$Res>  {
  factory $IamSizeCopyWith(IamSize value, $Res Function(IamSize) _then) = _$IamSizeCopyWithImpl;
@useResult
$Res call({
 double? width, double? height
});




}
/// @nodoc
class _$IamSizeCopyWithImpl<$Res>
    implements $IamSizeCopyWith<$Res> {
  _$IamSizeCopyWithImpl(this._self, this._then);

  final IamSize _self;
  final $Res Function(IamSize) _then;

/// Create a copy of IamSize
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = freezed,Object? height = freezed,}) {
  return _then(_self.copyWith(
width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [IamSize].
extension IamSizePatterns on IamSize {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamSize value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamSize() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamSize value)  $default,){
final _that = this;
switch (_that) {
case _IamSize():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamSize value)?  $default,){
final _that = this;
switch (_that) {
case _IamSize() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? width,  double? height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamSize() when $default != null:
return $default(_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? width,  double? height)  $default,) {final _that = this;
switch (_that) {
case _IamSize():
return $default(_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? width,  double? height)?  $default,) {final _that = this;
switch (_that) {
case _IamSize() when $default != null:
return $default(_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamSize implements IamSize {
  const _IamSize({this.width, this.height});
  factory _IamSize.fromJson(Map<String, dynamic> json) => _$IamSizeFromJson(json);

@override final  double? width;
@override final  double? height;

/// Create a copy of IamSize
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamSizeCopyWith<_IamSize> get copyWith => __$IamSizeCopyWithImpl<_IamSize>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamSizeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamSize&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height);

@override
String toString() {
  return 'IamSize(width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$IamSizeCopyWith<$Res> implements $IamSizeCopyWith<$Res> {
  factory _$IamSizeCopyWith(_IamSize value, $Res Function(_IamSize) _then) = __$IamSizeCopyWithImpl;
@override @useResult
$Res call({
 double? width, double? height
});




}
/// @nodoc
class __$IamSizeCopyWithImpl<$Res>
    implements _$IamSizeCopyWith<$Res> {
  __$IamSizeCopyWithImpl(this._self, this._then);

  final _IamSize _self;
  final $Res Function(_IamSize) _then;

/// Create a copy of IamSize
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = freezed,Object? height = freezed,}) {
  return _then(_IamSize(
width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$IamBorderRadius {

 double? get all; double? get topLeft; double? get topRight; double? get bottomLeft; double? get bottomRight;
/// Create a copy of IamBorderRadius
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamBorderRadiusCopyWith<IamBorderRadius> get copyWith => _$IamBorderRadiusCopyWithImpl<IamBorderRadius>(this as IamBorderRadius, _$identity);

  /// Serializes this IamBorderRadius to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamBorderRadius&&(identical(other.all, all) || other.all == all)&&(identical(other.topLeft, topLeft) || other.topLeft == topLeft)&&(identical(other.topRight, topRight) || other.topRight == topRight)&&(identical(other.bottomLeft, bottomLeft) || other.bottomLeft == bottomLeft)&&(identical(other.bottomRight, bottomRight) || other.bottomRight == bottomRight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,all,topLeft,topRight,bottomLeft,bottomRight);

@override
String toString() {
  return 'IamBorderRadius(all: $all, topLeft: $topLeft, topRight: $topRight, bottomLeft: $bottomLeft, bottomRight: $bottomRight)';
}


}

/// @nodoc
abstract mixin class $IamBorderRadiusCopyWith<$Res>  {
  factory $IamBorderRadiusCopyWith(IamBorderRadius value, $Res Function(IamBorderRadius) _then) = _$IamBorderRadiusCopyWithImpl;
@useResult
$Res call({
 double? all, double? topLeft, double? topRight, double? bottomLeft, double? bottomRight
});




}
/// @nodoc
class _$IamBorderRadiusCopyWithImpl<$Res>
    implements $IamBorderRadiusCopyWith<$Res> {
  _$IamBorderRadiusCopyWithImpl(this._self, this._then);

  final IamBorderRadius _self;
  final $Res Function(IamBorderRadius) _then;

/// Create a copy of IamBorderRadius
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? all = freezed,Object? topLeft = freezed,Object? topRight = freezed,Object? bottomLeft = freezed,Object? bottomRight = freezed,}) {
  return _then(_self.copyWith(
all: freezed == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as double?,topLeft: freezed == topLeft ? _self.topLeft : topLeft // ignore: cast_nullable_to_non_nullable
as double?,topRight: freezed == topRight ? _self.topRight : topRight // ignore: cast_nullable_to_non_nullable
as double?,bottomLeft: freezed == bottomLeft ? _self.bottomLeft : bottomLeft // ignore: cast_nullable_to_non_nullable
as double?,bottomRight: freezed == bottomRight ? _self.bottomRight : bottomRight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [IamBorderRadius].
extension IamBorderRadiusPatterns on IamBorderRadius {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamBorderRadius value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamBorderRadius() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamBorderRadius value)  $default,){
final _that = this;
switch (_that) {
case _IamBorderRadius():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamBorderRadius value)?  $default,){
final _that = this;
switch (_that) {
case _IamBorderRadius() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? all,  double? topLeft,  double? topRight,  double? bottomLeft,  double? bottomRight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamBorderRadius() when $default != null:
return $default(_that.all,_that.topLeft,_that.topRight,_that.bottomLeft,_that.bottomRight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? all,  double? topLeft,  double? topRight,  double? bottomLeft,  double? bottomRight)  $default,) {final _that = this;
switch (_that) {
case _IamBorderRadius():
return $default(_that.all,_that.topLeft,_that.topRight,_that.bottomLeft,_that.bottomRight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? all,  double? topLeft,  double? topRight,  double? bottomLeft,  double? bottomRight)?  $default,) {final _that = this;
switch (_that) {
case _IamBorderRadius() when $default != null:
return $default(_that.all,_that.topLeft,_that.topRight,_that.bottomLeft,_that.bottomRight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamBorderRadius implements IamBorderRadius {
  const _IamBorderRadius({this.all, this.topLeft, this.topRight, this.bottomLeft, this.bottomRight});
  factory _IamBorderRadius.fromJson(Map<String, dynamic> json) => _$IamBorderRadiusFromJson(json);

@override final  double? all;
@override final  double? topLeft;
@override final  double? topRight;
@override final  double? bottomLeft;
@override final  double? bottomRight;

/// Create a copy of IamBorderRadius
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamBorderRadiusCopyWith<_IamBorderRadius> get copyWith => __$IamBorderRadiusCopyWithImpl<_IamBorderRadius>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamBorderRadiusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamBorderRadius&&(identical(other.all, all) || other.all == all)&&(identical(other.topLeft, topLeft) || other.topLeft == topLeft)&&(identical(other.topRight, topRight) || other.topRight == topRight)&&(identical(other.bottomLeft, bottomLeft) || other.bottomLeft == bottomLeft)&&(identical(other.bottomRight, bottomRight) || other.bottomRight == bottomRight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,all,topLeft,topRight,bottomLeft,bottomRight);

@override
String toString() {
  return 'IamBorderRadius(all: $all, topLeft: $topLeft, topRight: $topRight, bottomLeft: $bottomLeft, bottomRight: $bottomRight)';
}


}

/// @nodoc
abstract mixin class _$IamBorderRadiusCopyWith<$Res> implements $IamBorderRadiusCopyWith<$Res> {
  factory _$IamBorderRadiusCopyWith(_IamBorderRadius value, $Res Function(_IamBorderRadius) _then) = __$IamBorderRadiusCopyWithImpl;
@override @useResult
$Res call({
 double? all, double? topLeft, double? topRight, double? bottomLeft, double? bottomRight
});




}
/// @nodoc
class __$IamBorderRadiusCopyWithImpl<$Res>
    implements _$IamBorderRadiusCopyWith<$Res> {
  __$IamBorderRadiusCopyWithImpl(this._self, this._then);

  final _IamBorderRadius _self;
  final $Res Function(_IamBorderRadius) _then;

/// Create a copy of IamBorderRadius
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? all = freezed,Object? topLeft = freezed,Object? topRight = freezed,Object? bottomLeft = freezed,Object? bottomRight = freezed,}) {
  return _then(_IamBorderRadius(
all: freezed == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as double?,topLeft: freezed == topLeft ? _self.topLeft : topLeft // ignore: cast_nullable_to_non_nullable
as double?,topRight: freezed == topRight ? _self.topRight : topRight // ignore: cast_nullable_to_non_nullable
as double?,bottomLeft: freezed == bottomLeft ? _self.bottomLeft : bottomLeft // ignore: cast_nullable_to_non_nullable
as double?,bottomRight: freezed == bottomRight ? _self.bottomRight : bottomRight // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$IamBorderSide {

 String? get color; double get width;
/// Create a copy of IamBorderSide
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamBorderSideCopyWith<IamBorderSide> get copyWith => _$IamBorderSideCopyWithImpl<IamBorderSide>(this as IamBorderSide, _$identity);

  /// Serializes this IamBorderSide to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamBorderSide&&(identical(other.color, color) || other.color == color)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,width);

@override
String toString() {
  return 'IamBorderSide(color: $color, width: $width)';
}


}

/// @nodoc
abstract mixin class $IamBorderSideCopyWith<$Res>  {
  factory $IamBorderSideCopyWith(IamBorderSide value, $Res Function(IamBorderSide) _then) = _$IamBorderSideCopyWithImpl;
@useResult
$Res call({
 String? color, double width
});




}
/// @nodoc
class _$IamBorderSideCopyWithImpl<$Res>
    implements $IamBorderSideCopyWith<$Res> {
  _$IamBorderSideCopyWithImpl(this._self, this._then);

  final IamBorderSide _self;
  final $Res Function(IamBorderSide) _then;

/// Create a copy of IamBorderSide
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = freezed,Object? width = null,}) {
  return _then(_self.copyWith(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [IamBorderSide].
extension IamBorderSidePatterns on IamBorderSide {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamBorderSide value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamBorderSide() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamBorderSide value)  $default,){
final _that = this;
switch (_that) {
case _IamBorderSide():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamBorderSide value)?  $default,){
final _that = this;
switch (_that) {
case _IamBorderSide() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? color,  double width)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamBorderSide() when $default != null:
return $default(_that.color,_that.width);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? color,  double width)  $default,) {final _that = this;
switch (_that) {
case _IamBorderSide():
return $default(_that.color,_that.width);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? color,  double width)?  $default,) {final _that = this;
switch (_that) {
case _IamBorderSide() when $default != null:
return $default(_that.color,_that.width);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamBorderSide implements IamBorderSide {
  const _IamBorderSide({this.color, this.width = 1.0});
  factory _IamBorderSide.fromJson(Map<String, dynamic> json) => _$IamBorderSideFromJson(json);

@override final  String? color;
@override@JsonKey() final  double width;

/// Create a copy of IamBorderSide
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamBorderSideCopyWith<_IamBorderSide> get copyWith => __$IamBorderSideCopyWithImpl<_IamBorderSide>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamBorderSideToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamBorderSide&&(identical(other.color, color) || other.color == color)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,width);

@override
String toString() {
  return 'IamBorderSide(color: $color, width: $width)';
}


}

/// @nodoc
abstract mixin class _$IamBorderSideCopyWith<$Res> implements $IamBorderSideCopyWith<$Res> {
  factory _$IamBorderSideCopyWith(_IamBorderSide value, $Res Function(_IamBorderSide) _then) = __$IamBorderSideCopyWithImpl;
@override @useResult
$Res call({
 String? color, double width
});




}
/// @nodoc
class __$IamBorderSideCopyWithImpl<$Res>
    implements _$IamBorderSideCopyWith<$Res> {
  __$IamBorderSideCopyWithImpl(this._self, this._then);

  final _IamBorderSide _self;
  final $Res Function(_IamBorderSide) _then;

/// Create a copy of IamBorderSide
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = freezed,Object? width = null,}) {
  return _then(_IamBorderSide(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$IamAlignment {

 IamNamedAlignment? get named; double? get x; double? get y;
/// Create a copy of IamAlignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamAlignmentCopyWith<IamAlignment> get copyWith => _$IamAlignmentCopyWithImpl<IamAlignment>(this as IamAlignment, _$identity);

  /// Serializes this IamAlignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamAlignment&&(identical(other.named, named) || other.named == named)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,named,x,y);

@override
String toString() {
  return 'IamAlignment(named: $named, x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class $IamAlignmentCopyWith<$Res>  {
  factory $IamAlignmentCopyWith(IamAlignment value, $Res Function(IamAlignment) _then) = _$IamAlignmentCopyWithImpl;
@useResult
$Res call({
 IamNamedAlignment? named, double? x, double? y
});




}
/// @nodoc
class _$IamAlignmentCopyWithImpl<$Res>
    implements $IamAlignmentCopyWith<$Res> {
  _$IamAlignmentCopyWithImpl(this._self, this._then);

  final IamAlignment _self;
  final $Res Function(IamAlignment) _then;

/// Create a copy of IamAlignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? named = freezed,Object? x = freezed,Object? y = freezed,}) {
  return _then(_self.copyWith(
named: freezed == named ? _self.named : named // ignore: cast_nullable_to_non_nullable
as IamNamedAlignment?,x: freezed == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double?,y: freezed == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [IamAlignment].
extension IamAlignmentPatterns on IamAlignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamAlignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamAlignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamAlignment value)  $default,){
final _that = this;
switch (_that) {
case _IamAlignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamAlignment value)?  $default,){
final _that = this;
switch (_that) {
case _IamAlignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IamNamedAlignment? named,  double? x,  double? y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamAlignment() when $default != null:
return $default(_that.named,_that.x,_that.y);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IamNamedAlignment? named,  double? x,  double? y)  $default,) {final _that = this;
switch (_that) {
case _IamAlignment():
return $default(_that.named,_that.x,_that.y);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IamNamedAlignment? named,  double? x,  double? y)?  $default,) {final _that = this;
switch (_that) {
case _IamAlignment() when $default != null:
return $default(_that.named,_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamAlignment implements IamAlignment {
  const _IamAlignment({this.named, this.x, this.y});
  factory _IamAlignment.fromJson(Map<String, dynamic> json) => _$IamAlignmentFromJson(json);

@override final  IamNamedAlignment? named;
@override final  double? x;
@override final  double? y;

/// Create a copy of IamAlignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamAlignmentCopyWith<_IamAlignment> get copyWith => __$IamAlignmentCopyWithImpl<_IamAlignment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamAlignmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamAlignment&&(identical(other.named, named) || other.named == named)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,named,x,y);

@override
String toString() {
  return 'IamAlignment(named: $named, x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$IamAlignmentCopyWith<$Res> implements $IamAlignmentCopyWith<$Res> {
  factory _$IamAlignmentCopyWith(_IamAlignment value, $Res Function(_IamAlignment) _then) = __$IamAlignmentCopyWithImpl;
@override @useResult
$Res call({
 IamNamedAlignment? named, double? x, double? y
});




}
/// @nodoc
class __$IamAlignmentCopyWithImpl<$Res>
    implements _$IamAlignmentCopyWith<$Res> {
  __$IamAlignmentCopyWithImpl(this._self, this._then);

  final _IamAlignment _self;
  final $Res Function(_IamAlignment) _then;

/// Create a copy of IamAlignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? named = freezed,Object? x = freezed,Object? y = freezed,}) {
  return _then(_IamAlignment(
named: freezed == named ? _self.named : named // ignore: cast_nullable_to_non_nullable
as IamNamedAlignment?,x: freezed == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double?,y: freezed == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$IamTextStyle {

 String? get color; double? get fontSize; IamFontWeight? get fontWeight; IamFontStyle? get fontStyle; double? get letterSpacing; double? get wordSpacing; double? get height; String? get fontFamily;
/// Create a copy of IamTextStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamTextStyleCopyWith<IamTextStyle> get copyWith => _$IamTextStyleCopyWithImpl<IamTextStyle>(this as IamTextStyle, _$identity);

  /// Serializes this IamTextStyle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamTextStyle&&(identical(other.color, color) || other.color == color)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.fontWeight, fontWeight) || other.fontWeight == fontWeight)&&(identical(other.fontStyle, fontStyle) || other.fontStyle == fontStyle)&&(identical(other.letterSpacing, letterSpacing) || other.letterSpacing == letterSpacing)&&(identical(other.wordSpacing, wordSpacing) || other.wordSpacing == wordSpacing)&&(identical(other.height, height) || other.height == height)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,fontSize,fontWeight,fontStyle,letterSpacing,wordSpacing,height,fontFamily);

@override
String toString() {
  return 'IamTextStyle(color: $color, fontSize: $fontSize, fontWeight: $fontWeight, fontStyle: $fontStyle, letterSpacing: $letterSpacing, wordSpacing: $wordSpacing, height: $height, fontFamily: $fontFamily)';
}


}

/// @nodoc
abstract mixin class $IamTextStyleCopyWith<$Res>  {
  factory $IamTextStyleCopyWith(IamTextStyle value, $Res Function(IamTextStyle) _then) = _$IamTextStyleCopyWithImpl;
@useResult
$Res call({
 String? color, double? fontSize, IamFontWeight? fontWeight, IamFontStyle? fontStyle, double? letterSpacing, double? wordSpacing, double? height, String? fontFamily
});




}
/// @nodoc
class _$IamTextStyleCopyWithImpl<$Res>
    implements $IamTextStyleCopyWith<$Res> {
  _$IamTextStyleCopyWithImpl(this._self, this._then);

  final IamTextStyle _self;
  final $Res Function(IamTextStyle) _then;

/// Create a copy of IamTextStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = freezed,Object? fontSize = freezed,Object? fontWeight = freezed,Object? fontStyle = freezed,Object? letterSpacing = freezed,Object? wordSpacing = freezed,Object? height = freezed,Object? fontFamily = freezed,}) {
  return _then(_self.copyWith(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,fontSize: freezed == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double?,fontWeight: freezed == fontWeight ? _self.fontWeight : fontWeight // ignore: cast_nullable_to_non_nullable
as IamFontWeight?,fontStyle: freezed == fontStyle ? _self.fontStyle : fontStyle // ignore: cast_nullable_to_non_nullable
as IamFontStyle?,letterSpacing: freezed == letterSpacing ? _self.letterSpacing : letterSpacing // ignore: cast_nullable_to_non_nullable
as double?,wordSpacing: freezed == wordSpacing ? _self.wordSpacing : wordSpacing // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IamTextStyle].
extension IamTextStylePatterns on IamTextStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamTextStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamTextStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamTextStyle value)  $default,){
final _that = this;
switch (_that) {
case _IamTextStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamTextStyle value)?  $default,){
final _that = this;
switch (_that) {
case _IamTextStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? color,  double? fontSize,  IamFontWeight? fontWeight,  IamFontStyle? fontStyle,  double? letterSpacing,  double? wordSpacing,  double? height,  String? fontFamily)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamTextStyle() when $default != null:
return $default(_that.color,_that.fontSize,_that.fontWeight,_that.fontStyle,_that.letterSpacing,_that.wordSpacing,_that.height,_that.fontFamily);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? color,  double? fontSize,  IamFontWeight? fontWeight,  IamFontStyle? fontStyle,  double? letterSpacing,  double? wordSpacing,  double? height,  String? fontFamily)  $default,) {final _that = this;
switch (_that) {
case _IamTextStyle():
return $default(_that.color,_that.fontSize,_that.fontWeight,_that.fontStyle,_that.letterSpacing,_that.wordSpacing,_that.height,_that.fontFamily);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? color,  double? fontSize,  IamFontWeight? fontWeight,  IamFontStyle? fontStyle,  double? letterSpacing,  double? wordSpacing,  double? height,  String? fontFamily)?  $default,) {final _that = this;
switch (_that) {
case _IamTextStyle() when $default != null:
return $default(_that.color,_that.fontSize,_that.fontWeight,_that.fontStyle,_that.letterSpacing,_that.wordSpacing,_that.height,_that.fontFamily);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamTextStyle implements IamTextStyle {
  const _IamTextStyle({this.color, this.fontSize, this.fontWeight, this.fontStyle, this.letterSpacing, this.wordSpacing, this.height, this.fontFamily});
  factory _IamTextStyle.fromJson(Map<String, dynamic> json) => _$IamTextStyleFromJson(json);

@override final  String? color;
@override final  double? fontSize;
@override final  IamFontWeight? fontWeight;
@override final  IamFontStyle? fontStyle;
@override final  double? letterSpacing;
@override final  double? wordSpacing;
@override final  double? height;
@override final  String? fontFamily;

/// Create a copy of IamTextStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamTextStyleCopyWith<_IamTextStyle> get copyWith => __$IamTextStyleCopyWithImpl<_IamTextStyle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamTextStyleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamTextStyle&&(identical(other.color, color) || other.color == color)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.fontWeight, fontWeight) || other.fontWeight == fontWeight)&&(identical(other.fontStyle, fontStyle) || other.fontStyle == fontStyle)&&(identical(other.letterSpacing, letterSpacing) || other.letterSpacing == letterSpacing)&&(identical(other.wordSpacing, wordSpacing) || other.wordSpacing == wordSpacing)&&(identical(other.height, height) || other.height == height)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,fontSize,fontWeight,fontStyle,letterSpacing,wordSpacing,height,fontFamily);

@override
String toString() {
  return 'IamTextStyle(color: $color, fontSize: $fontSize, fontWeight: $fontWeight, fontStyle: $fontStyle, letterSpacing: $letterSpacing, wordSpacing: $wordSpacing, height: $height, fontFamily: $fontFamily)';
}


}

/// @nodoc
abstract mixin class _$IamTextStyleCopyWith<$Res> implements $IamTextStyleCopyWith<$Res> {
  factory _$IamTextStyleCopyWith(_IamTextStyle value, $Res Function(_IamTextStyle) _then) = __$IamTextStyleCopyWithImpl;
@override @useResult
$Res call({
 String? color, double? fontSize, IamFontWeight? fontWeight, IamFontStyle? fontStyle, double? letterSpacing, double? wordSpacing, double? height, String? fontFamily
});




}
/// @nodoc
class __$IamTextStyleCopyWithImpl<$Res>
    implements _$IamTextStyleCopyWith<$Res> {
  __$IamTextStyleCopyWithImpl(this._self, this._then);

  final _IamTextStyle _self;
  final $Res Function(_IamTextStyle) _then;

/// Create a copy of IamTextStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = freezed,Object? fontSize = freezed,Object? fontWeight = freezed,Object? fontStyle = freezed,Object? letterSpacing = freezed,Object? wordSpacing = freezed,Object? height = freezed,Object? fontFamily = freezed,}) {
  return _then(_IamTextStyle(
color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,fontSize: freezed == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double?,fontWeight: freezed == fontWeight ? _self.fontWeight : fontWeight // ignore: cast_nullable_to_non_nullable
as IamFontWeight?,fontStyle: freezed == fontStyle ? _self.fontStyle : fontStyle // ignore: cast_nullable_to_non_nullable
as IamFontStyle?,letterSpacing: freezed == letterSpacing ? _self.letterSpacing : letterSpacing // ignore: cast_nullable_to_non_nullable
as double?,wordSpacing: freezed == wordSpacing ? _self.wordSpacing : wordSpacing // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$IamCtaButtonStyle {

// Colors
 String? get backgroundColor; String? get foregroundColor; String? get overlayColor;// Text
 IamTextStyle? get textStyle;// Spacing / sizing
 IamEdgeInsets? get padding; IamSize? get minimumSize;// Shape
 IamBorderRadius? get borderRadius; IamBorderSide? get border; double? get elevation;// Icon
 IamCtaIconAlignmentJson? get iconAlignment;// Behavior
 bool? get enabled;
/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamCtaButtonStyleCopyWith<IamCtaButtonStyle> get copyWith => _$IamCtaButtonStyleCopyWithImpl<IamCtaButtonStyle>(this as IamCtaButtonStyle, _$identity);

  /// Serializes this IamCtaButtonStyle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamCtaButtonStyle&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.foregroundColor, foregroundColor) || other.foregroundColor == foregroundColor)&&(identical(other.overlayColor, overlayColor) || other.overlayColor == overlayColor)&&(identical(other.textStyle, textStyle) || other.textStyle == textStyle)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.minimumSize, minimumSize) || other.minimumSize == minimumSize)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.border, border) || other.border == border)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.iconAlignment, iconAlignment) || other.iconAlignment == iconAlignment)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,backgroundColor,foregroundColor,overlayColor,textStyle,padding,minimumSize,borderRadius,border,elevation,iconAlignment,enabled);

@override
String toString() {
  return 'IamCtaButtonStyle(backgroundColor: $backgroundColor, foregroundColor: $foregroundColor, overlayColor: $overlayColor, textStyle: $textStyle, padding: $padding, minimumSize: $minimumSize, borderRadius: $borderRadius, border: $border, elevation: $elevation, iconAlignment: $iconAlignment, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $IamCtaButtonStyleCopyWith<$Res>  {
  factory $IamCtaButtonStyleCopyWith(IamCtaButtonStyle value, $Res Function(IamCtaButtonStyle) _then) = _$IamCtaButtonStyleCopyWithImpl;
@useResult
$Res call({
 String? backgroundColor, String? foregroundColor, String? overlayColor, IamTextStyle? textStyle, IamEdgeInsets? padding, IamSize? minimumSize, IamBorderRadius? borderRadius, IamBorderSide? border, double? elevation, IamCtaIconAlignmentJson? iconAlignment, bool? enabled
});


$IamTextStyleCopyWith<$Res>? get textStyle;$IamEdgeInsetsCopyWith<$Res>? get padding;$IamSizeCopyWith<$Res>? get minimumSize;$IamBorderRadiusCopyWith<$Res>? get borderRadius;$IamBorderSideCopyWith<$Res>? get border;

}
/// @nodoc
class _$IamCtaButtonStyleCopyWithImpl<$Res>
    implements $IamCtaButtonStyleCopyWith<$Res> {
  _$IamCtaButtonStyleCopyWithImpl(this._self, this._then);

  final IamCtaButtonStyle _self;
  final $Res Function(IamCtaButtonStyle) _then;

/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backgroundColor = freezed,Object? foregroundColor = freezed,Object? overlayColor = freezed,Object? textStyle = freezed,Object? padding = freezed,Object? minimumSize = freezed,Object? borderRadius = freezed,Object? border = freezed,Object? elevation = freezed,Object? iconAlignment = freezed,Object? enabled = freezed,}) {
  return _then(_self.copyWith(
backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String?,foregroundColor: freezed == foregroundColor ? _self.foregroundColor : foregroundColor // ignore: cast_nullable_to_non_nullable
as String?,overlayColor: freezed == overlayColor ? _self.overlayColor : overlayColor // ignore: cast_nullable_to_non_nullable
as String?,textStyle: freezed == textStyle ? _self.textStyle : textStyle // ignore: cast_nullable_to_non_nullable
as IamTextStyle?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as IamEdgeInsets?,minimumSize: freezed == minimumSize ? _self.minimumSize : minimumSize // ignore: cast_nullable_to_non_nullable
as IamSize?,borderRadius: freezed == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as IamBorderRadius?,border: freezed == border ? _self.border : border // ignore: cast_nullable_to_non_nullable
as IamBorderSide?,elevation: freezed == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double?,iconAlignment: freezed == iconAlignment ? _self.iconAlignment : iconAlignment // ignore: cast_nullable_to_non_nullable
as IamCtaIconAlignmentJson?,enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamTextStyleCopyWith<$Res>? get textStyle {
    if (_self.textStyle == null) {
    return null;
  }

  return $IamTextStyleCopyWith<$Res>(_self.textStyle!, (value) {
    return _then(_self.copyWith(textStyle: value));
  });
}/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamEdgeInsetsCopyWith<$Res>? get padding {
    if (_self.padding == null) {
    return null;
  }

  return $IamEdgeInsetsCopyWith<$Res>(_self.padding!, (value) {
    return _then(_self.copyWith(padding: value));
  });
}/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamSizeCopyWith<$Res>? get minimumSize {
    if (_self.minimumSize == null) {
    return null;
  }

  return $IamSizeCopyWith<$Res>(_self.minimumSize!, (value) {
    return _then(_self.copyWith(minimumSize: value));
  });
}/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamBorderRadiusCopyWith<$Res>? get borderRadius {
    if (_self.borderRadius == null) {
    return null;
  }

  return $IamBorderRadiusCopyWith<$Res>(_self.borderRadius!, (value) {
    return _then(_self.copyWith(borderRadius: value));
  });
}/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamBorderSideCopyWith<$Res>? get border {
    if (_self.border == null) {
    return null;
  }

  return $IamBorderSideCopyWith<$Res>(_self.border!, (value) {
    return _then(_self.copyWith(border: value));
  });
}
}


/// Adds pattern-matching-related methods to [IamCtaButtonStyle].
extension IamCtaButtonStylePatterns on IamCtaButtonStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamCtaButtonStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamCtaButtonStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamCtaButtonStyle value)  $default,){
final _that = this;
switch (_that) {
case _IamCtaButtonStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamCtaButtonStyle value)?  $default,){
final _that = this;
switch (_that) {
case _IamCtaButtonStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? backgroundColor,  String? foregroundColor,  String? overlayColor,  IamTextStyle? textStyle,  IamEdgeInsets? padding,  IamSize? minimumSize,  IamBorderRadius? borderRadius,  IamBorderSide? border,  double? elevation,  IamCtaIconAlignmentJson? iconAlignment,  bool? enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamCtaButtonStyle() when $default != null:
return $default(_that.backgroundColor,_that.foregroundColor,_that.overlayColor,_that.textStyle,_that.padding,_that.minimumSize,_that.borderRadius,_that.border,_that.elevation,_that.iconAlignment,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? backgroundColor,  String? foregroundColor,  String? overlayColor,  IamTextStyle? textStyle,  IamEdgeInsets? padding,  IamSize? minimumSize,  IamBorderRadius? borderRadius,  IamBorderSide? border,  double? elevation,  IamCtaIconAlignmentJson? iconAlignment,  bool? enabled)  $default,) {final _that = this;
switch (_that) {
case _IamCtaButtonStyle():
return $default(_that.backgroundColor,_that.foregroundColor,_that.overlayColor,_that.textStyle,_that.padding,_that.minimumSize,_that.borderRadius,_that.border,_that.elevation,_that.iconAlignment,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? backgroundColor,  String? foregroundColor,  String? overlayColor,  IamTextStyle? textStyle,  IamEdgeInsets? padding,  IamSize? minimumSize,  IamBorderRadius? borderRadius,  IamBorderSide? border,  double? elevation,  IamCtaIconAlignmentJson? iconAlignment,  bool? enabled)?  $default,) {final _that = this;
switch (_that) {
case _IamCtaButtonStyle() when $default != null:
return $default(_that.backgroundColor,_that.foregroundColor,_that.overlayColor,_that.textStyle,_that.padding,_that.minimumSize,_that.borderRadius,_that.border,_that.elevation,_that.iconAlignment,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamCtaButtonStyle implements IamCtaButtonStyle {
  const _IamCtaButtonStyle({this.backgroundColor, this.foregroundColor, this.overlayColor, this.textStyle, this.padding, this.minimumSize, this.borderRadius, this.border, this.elevation, this.iconAlignment, this.enabled});
  factory _IamCtaButtonStyle.fromJson(Map<String, dynamic> json) => _$IamCtaButtonStyleFromJson(json);

// Colors
@override final  String? backgroundColor;
@override final  String? foregroundColor;
@override final  String? overlayColor;
// Text
@override final  IamTextStyle? textStyle;
// Spacing / sizing
@override final  IamEdgeInsets? padding;
@override final  IamSize? minimumSize;
// Shape
@override final  IamBorderRadius? borderRadius;
@override final  IamBorderSide? border;
@override final  double? elevation;
// Icon
@override final  IamCtaIconAlignmentJson? iconAlignment;
// Behavior
@override final  bool? enabled;

/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamCtaButtonStyleCopyWith<_IamCtaButtonStyle> get copyWith => __$IamCtaButtonStyleCopyWithImpl<_IamCtaButtonStyle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamCtaButtonStyleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamCtaButtonStyle&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.foregroundColor, foregroundColor) || other.foregroundColor == foregroundColor)&&(identical(other.overlayColor, overlayColor) || other.overlayColor == overlayColor)&&(identical(other.textStyle, textStyle) || other.textStyle == textStyle)&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.minimumSize, minimumSize) || other.minimumSize == minimumSize)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.border, border) || other.border == border)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.iconAlignment, iconAlignment) || other.iconAlignment == iconAlignment)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,backgroundColor,foregroundColor,overlayColor,textStyle,padding,minimumSize,borderRadius,border,elevation,iconAlignment,enabled);

@override
String toString() {
  return 'IamCtaButtonStyle(backgroundColor: $backgroundColor, foregroundColor: $foregroundColor, overlayColor: $overlayColor, textStyle: $textStyle, padding: $padding, minimumSize: $minimumSize, borderRadius: $borderRadius, border: $border, elevation: $elevation, iconAlignment: $iconAlignment, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$IamCtaButtonStyleCopyWith<$Res> implements $IamCtaButtonStyleCopyWith<$Res> {
  factory _$IamCtaButtonStyleCopyWith(_IamCtaButtonStyle value, $Res Function(_IamCtaButtonStyle) _then) = __$IamCtaButtonStyleCopyWithImpl;
@override @useResult
$Res call({
 String? backgroundColor, String? foregroundColor, String? overlayColor, IamTextStyle? textStyle, IamEdgeInsets? padding, IamSize? minimumSize, IamBorderRadius? borderRadius, IamBorderSide? border, double? elevation, IamCtaIconAlignmentJson? iconAlignment, bool? enabled
});


@override $IamTextStyleCopyWith<$Res>? get textStyle;@override $IamEdgeInsetsCopyWith<$Res>? get padding;@override $IamSizeCopyWith<$Res>? get minimumSize;@override $IamBorderRadiusCopyWith<$Res>? get borderRadius;@override $IamBorderSideCopyWith<$Res>? get border;

}
/// @nodoc
class __$IamCtaButtonStyleCopyWithImpl<$Res>
    implements _$IamCtaButtonStyleCopyWith<$Res> {
  __$IamCtaButtonStyleCopyWithImpl(this._self, this._then);

  final _IamCtaButtonStyle _self;
  final $Res Function(_IamCtaButtonStyle) _then;

/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backgroundColor = freezed,Object? foregroundColor = freezed,Object? overlayColor = freezed,Object? textStyle = freezed,Object? padding = freezed,Object? minimumSize = freezed,Object? borderRadius = freezed,Object? border = freezed,Object? elevation = freezed,Object? iconAlignment = freezed,Object? enabled = freezed,}) {
  return _then(_IamCtaButtonStyle(
backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String?,foregroundColor: freezed == foregroundColor ? _self.foregroundColor : foregroundColor // ignore: cast_nullable_to_non_nullable
as String?,overlayColor: freezed == overlayColor ? _self.overlayColor : overlayColor // ignore: cast_nullable_to_non_nullable
as String?,textStyle: freezed == textStyle ? _self.textStyle : textStyle // ignore: cast_nullable_to_non_nullable
as IamTextStyle?,padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as IamEdgeInsets?,minimumSize: freezed == minimumSize ? _self.minimumSize : minimumSize // ignore: cast_nullable_to_non_nullable
as IamSize?,borderRadius: freezed == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as IamBorderRadius?,border: freezed == border ? _self.border : border // ignore: cast_nullable_to_non_nullable
as IamBorderSide?,elevation: freezed == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double?,iconAlignment: freezed == iconAlignment ? _self.iconAlignment : iconAlignment // ignore: cast_nullable_to_non_nullable
as IamCtaIconAlignmentJson?,enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamTextStyleCopyWith<$Res>? get textStyle {
    if (_self.textStyle == null) {
    return null;
  }

  return $IamTextStyleCopyWith<$Res>(_self.textStyle!, (value) {
    return _then(_self.copyWith(textStyle: value));
  });
}/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamEdgeInsetsCopyWith<$Res>? get padding {
    if (_self.padding == null) {
    return null;
  }

  return $IamEdgeInsetsCopyWith<$Res>(_self.padding!, (value) {
    return _then(_self.copyWith(padding: value));
  });
}/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamSizeCopyWith<$Res>? get minimumSize {
    if (_self.minimumSize == null) {
    return null;
  }

  return $IamSizeCopyWith<$Res>(_self.minimumSize!, (value) {
    return _then(_self.copyWith(minimumSize: value));
  });
}/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamBorderRadiusCopyWith<$Res>? get borderRadius {
    if (_self.borderRadius == null) {
    return null;
  }

  return $IamBorderRadiusCopyWith<$Res>(_self.borderRadius!, (value) {
    return _then(_self.copyWith(borderRadius: value));
  });
}/// Create a copy of IamCtaButtonStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamBorderSideCopyWith<$Res>? get border {
    if (_self.border == null) {
    return null;
  }

  return $IamBorderSideCopyWith<$Res>(_self.border!, (value) {
    return _then(_self.copyWith(border: value));
  });
}
}


/// @nodoc
mixin _$IamBodyStyle {

// Layout / spacing
 IamEdgeInsets? get padding; double? get imageBottomSpacing; double? get titleBottomSpacing; double? get bodyBottomSpacing; double? get primaryCtaBottomSpacing; IamCrossAxisAlignment? get crossAxisAlignment; IamTextAlign? get textAlign; bool? get scrollable;// Background
 String? get backgroundColor;// Text styles
 IamTextStyle? get titleStyle; IamTextStyle? get bodyStyle;// Image
 IamBoxFit? get imageFit; double? get imageHeight; double? get imageWidth; IamBorderRadius? get imageBorderRadius;// Close button
 bool? get showCloseButton; String? get closeIconColor; String? get closeButtonBackgroundColor; IamAlignment? get closeButtonAlignment; String? get closeButtonTooltip;// CTA passthrough
 IamCtaButtonStyle? get primaryCtaStyle; IamCtaButtonStyle? get secondaryCtaStyle; IamSize? get ctaMinimumSize; IamBorderRadius? get ctaBorderRadius;
/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamBodyStyleCopyWith<IamBodyStyle> get copyWith => _$IamBodyStyleCopyWithImpl<IamBodyStyle>(this as IamBodyStyle, _$identity);

  /// Serializes this IamBodyStyle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamBodyStyle&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.imageBottomSpacing, imageBottomSpacing) || other.imageBottomSpacing == imageBottomSpacing)&&(identical(other.titleBottomSpacing, titleBottomSpacing) || other.titleBottomSpacing == titleBottomSpacing)&&(identical(other.bodyBottomSpacing, bodyBottomSpacing) || other.bodyBottomSpacing == bodyBottomSpacing)&&(identical(other.primaryCtaBottomSpacing, primaryCtaBottomSpacing) || other.primaryCtaBottomSpacing == primaryCtaBottomSpacing)&&(identical(other.crossAxisAlignment, crossAxisAlignment) || other.crossAxisAlignment == crossAxisAlignment)&&(identical(other.textAlign, textAlign) || other.textAlign == textAlign)&&(identical(other.scrollable, scrollable) || other.scrollable == scrollable)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.titleStyle, titleStyle) || other.titleStyle == titleStyle)&&(identical(other.bodyStyle, bodyStyle) || other.bodyStyle == bodyStyle)&&(identical(other.imageFit, imageFit) || other.imageFit == imageFit)&&(identical(other.imageHeight, imageHeight) || other.imageHeight == imageHeight)&&(identical(other.imageWidth, imageWidth) || other.imageWidth == imageWidth)&&(identical(other.imageBorderRadius, imageBorderRadius) || other.imageBorderRadius == imageBorderRadius)&&(identical(other.showCloseButton, showCloseButton) || other.showCloseButton == showCloseButton)&&(identical(other.closeIconColor, closeIconColor) || other.closeIconColor == closeIconColor)&&(identical(other.closeButtonBackgroundColor, closeButtonBackgroundColor) || other.closeButtonBackgroundColor == closeButtonBackgroundColor)&&(identical(other.closeButtonAlignment, closeButtonAlignment) || other.closeButtonAlignment == closeButtonAlignment)&&(identical(other.closeButtonTooltip, closeButtonTooltip) || other.closeButtonTooltip == closeButtonTooltip)&&(identical(other.primaryCtaStyle, primaryCtaStyle) || other.primaryCtaStyle == primaryCtaStyle)&&(identical(other.secondaryCtaStyle, secondaryCtaStyle) || other.secondaryCtaStyle == secondaryCtaStyle)&&(identical(other.ctaMinimumSize, ctaMinimumSize) || other.ctaMinimumSize == ctaMinimumSize)&&(identical(other.ctaBorderRadius, ctaBorderRadius) || other.ctaBorderRadius == ctaBorderRadius));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,padding,imageBottomSpacing,titleBottomSpacing,bodyBottomSpacing,primaryCtaBottomSpacing,crossAxisAlignment,textAlign,scrollable,backgroundColor,titleStyle,bodyStyle,imageFit,imageHeight,imageWidth,imageBorderRadius,showCloseButton,closeIconColor,closeButtonBackgroundColor,closeButtonAlignment,closeButtonTooltip,primaryCtaStyle,secondaryCtaStyle,ctaMinimumSize,ctaBorderRadius]);

@override
String toString() {
  return 'IamBodyStyle(padding: $padding, imageBottomSpacing: $imageBottomSpacing, titleBottomSpacing: $titleBottomSpacing, bodyBottomSpacing: $bodyBottomSpacing, primaryCtaBottomSpacing: $primaryCtaBottomSpacing, crossAxisAlignment: $crossAxisAlignment, textAlign: $textAlign, scrollable: $scrollable, backgroundColor: $backgroundColor, titleStyle: $titleStyle, bodyStyle: $bodyStyle, imageFit: $imageFit, imageHeight: $imageHeight, imageWidth: $imageWidth, imageBorderRadius: $imageBorderRadius, showCloseButton: $showCloseButton, closeIconColor: $closeIconColor, closeButtonBackgroundColor: $closeButtonBackgroundColor, closeButtonAlignment: $closeButtonAlignment, closeButtonTooltip: $closeButtonTooltip, primaryCtaStyle: $primaryCtaStyle, secondaryCtaStyle: $secondaryCtaStyle, ctaMinimumSize: $ctaMinimumSize, ctaBorderRadius: $ctaBorderRadius)';
}


}

/// @nodoc
abstract mixin class $IamBodyStyleCopyWith<$Res>  {
  factory $IamBodyStyleCopyWith(IamBodyStyle value, $Res Function(IamBodyStyle) _then) = _$IamBodyStyleCopyWithImpl;
@useResult
$Res call({
 IamEdgeInsets? padding, double? imageBottomSpacing, double? titleBottomSpacing, double? bodyBottomSpacing, double? primaryCtaBottomSpacing, IamCrossAxisAlignment? crossAxisAlignment, IamTextAlign? textAlign, bool? scrollable, String? backgroundColor, IamTextStyle? titleStyle, IamTextStyle? bodyStyle, IamBoxFit? imageFit, double? imageHeight, double? imageWidth, IamBorderRadius? imageBorderRadius, bool? showCloseButton, String? closeIconColor, String? closeButtonBackgroundColor, IamAlignment? closeButtonAlignment, String? closeButtonTooltip, IamCtaButtonStyle? primaryCtaStyle, IamCtaButtonStyle? secondaryCtaStyle, IamSize? ctaMinimumSize, IamBorderRadius? ctaBorderRadius
});


$IamEdgeInsetsCopyWith<$Res>? get padding;$IamTextStyleCopyWith<$Res>? get titleStyle;$IamTextStyleCopyWith<$Res>? get bodyStyle;$IamBorderRadiusCopyWith<$Res>? get imageBorderRadius;$IamAlignmentCopyWith<$Res>? get closeButtonAlignment;$IamCtaButtonStyleCopyWith<$Res>? get primaryCtaStyle;$IamCtaButtonStyleCopyWith<$Res>? get secondaryCtaStyle;$IamSizeCopyWith<$Res>? get ctaMinimumSize;$IamBorderRadiusCopyWith<$Res>? get ctaBorderRadius;

}
/// @nodoc
class _$IamBodyStyleCopyWithImpl<$Res>
    implements $IamBodyStyleCopyWith<$Res> {
  _$IamBodyStyleCopyWithImpl(this._self, this._then);

  final IamBodyStyle _self;
  final $Res Function(IamBodyStyle) _then;

/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? padding = freezed,Object? imageBottomSpacing = freezed,Object? titleBottomSpacing = freezed,Object? bodyBottomSpacing = freezed,Object? primaryCtaBottomSpacing = freezed,Object? crossAxisAlignment = freezed,Object? textAlign = freezed,Object? scrollable = freezed,Object? backgroundColor = freezed,Object? titleStyle = freezed,Object? bodyStyle = freezed,Object? imageFit = freezed,Object? imageHeight = freezed,Object? imageWidth = freezed,Object? imageBorderRadius = freezed,Object? showCloseButton = freezed,Object? closeIconColor = freezed,Object? closeButtonBackgroundColor = freezed,Object? closeButtonAlignment = freezed,Object? closeButtonTooltip = freezed,Object? primaryCtaStyle = freezed,Object? secondaryCtaStyle = freezed,Object? ctaMinimumSize = freezed,Object? ctaBorderRadius = freezed,}) {
  return _then(_self.copyWith(
padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as IamEdgeInsets?,imageBottomSpacing: freezed == imageBottomSpacing ? _self.imageBottomSpacing : imageBottomSpacing // ignore: cast_nullable_to_non_nullable
as double?,titleBottomSpacing: freezed == titleBottomSpacing ? _self.titleBottomSpacing : titleBottomSpacing // ignore: cast_nullable_to_non_nullable
as double?,bodyBottomSpacing: freezed == bodyBottomSpacing ? _self.bodyBottomSpacing : bodyBottomSpacing // ignore: cast_nullable_to_non_nullable
as double?,primaryCtaBottomSpacing: freezed == primaryCtaBottomSpacing ? _self.primaryCtaBottomSpacing : primaryCtaBottomSpacing // ignore: cast_nullable_to_non_nullable
as double?,crossAxisAlignment: freezed == crossAxisAlignment ? _self.crossAxisAlignment : crossAxisAlignment // ignore: cast_nullable_to_non_nullable
as IamCrossAxisAlignment?,textAlign: freezed == textAlign ? _self.textAlign : textAlign // ignore: cast_nullable_to_non_nullable
as IamTextAlign?,scrollable: freezed == scrollable ? _self.scrollable : scrollable // ignore: cast_nullable_to_non_nullable
as bool?,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String?,titleStyle: freezed == titleStyle ? _self.titleStyle : titleStyle // ignore: cast_nullable_to_non_nullable
as IamTextStyle?,bodyStyle: freezed == bodyStyle ? _self.bodyStyle : bodyStyle // ignore: cast_nullable_to_non_nullable
as IamTextStyle?,imageFit: freezed == imageFit ? _self.imageFit : imageFit // ignore: cast_nullable_to_non_nullable
as IamBoxFit?,imageHeight: freezed == imageHeight ? _self.imageHeight : imageHeight // ignore: cast_nullable_to_non_nullable
as double?,imageWidth: freezed == imageWidth ? _self.imageWidth : imageWidth // ignore: cast_nullable_to_non_nullable
as double?,imageBorderRadius: freezed == imageBorderRadius ? _self.imageBorderRadius : imageBorderRadius // ignore: cast_nullable_to_non_nullable
as IamBorderRadius?,showCloseButton: freezed == showCloseButton ? _self.showCloseButton : showCloseButton // ignore: cast_nullable_to_non_nullable
as bool?,closeIconColor: freezed == closeIconColor ? _self.closeIconColor : closeIconColor // ignore: cast_nullable_to_non_nullable
as String?,closeButtonBackgroundColor: freezed == closeButtonBackgroundColor ? _self.closeButtonBackgroundColor : closeButtonBackgroundColor // ignore: cast_nullable_to_non_nullable
as String?,closeButtonAlignment: freezed == closeButtonAlignment ? _self.closeButtonAlignment : closeButtonAlignment // ignore: cast_nullable_to_non_nullable
as IamAlignment?,closeButtonTooltip: freezed == closeButtonTooltip ? _self.closeButtonTooltip : closeButtonTooltip // ignore: cast_nullable_to_non_nullable
as String?,primaryCtaStyle: freezed == primaryCtaStyle ? _self.primaryCtaStyle : primaryCtaStyle // ignore: cast_nullable_to_non_nullable
as IamCtaButtonStyle?,secondaryCtaStyle: freezed == secondaryCtaStyle ? _self.secondaryCtaStyle : secondaryCtaStyle // ignore: cast_nullable_to_non_nullable
as IamCtaButtonStyle?,ctaMinimumSize: freezed == ctaMinimumSize ? _self.ctaMinimumSize : ctaMinimumSize // ignore: cast_nullable_to_non_nullable
as IamSize?,ctaBorderRadius: freezed == ctaBorderRadius ? _self.ctaBorderRadius : ctaBorderRadius // ignore: cast_nullable_to_non_nullable
as IamBorderRadius?,
  ));
}
/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamEdgeInsetsCopyWith<$Res>? get padding {
    if (_self.padding == null) {
    return null;
  }

  return $IamEdgeInsetsCopyWith<$Res>(_self.padding!, (value) {
    return _then(_self.copyWith(padding: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamTextStyleCopyWith<$Res>? get titleStyle {
    if (_self.titleStyle == null) {
    return null;
  }

  return $IamTextStyleCopyWith<$Res>(_self.titleStyle!, (value) {
    return _then(_self.copyWith(titleStyle: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamTextStyleCopyWith<$Res>? get bodyStyle {
    if (_self.bodyStyle == null) {
    return null;
  }

  return $IamTextStyleCopyWith<$Res>(_self.bodyStyle!, (value) {
    return _then(_self.copyWith(bodyStyle: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamBorderRadiusCopyWith<$Res>? get imageBorderRadius {
    if (_self.imageBorderRadius == null) {
    return null;
  }

  return $IamBorderRadiusCopyWith<$Res>(_self.imageBorderRadius!, (value) {
    return _then(_self.copyWith(imageBorderRadius: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamAlignmentCopyWith<$Res>? get closeButtonAlignment {
    if (_self.closeButtonAlignment == null) {
    return null;
  }

  return $IamAlignmentCopyWith<$Res>(_self.closeButtonAlignment!, (value) {
    return _then(_self.copyWith(closeButtonAlignment: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamCtaButtonStyleCopyWith<$Res>? get primaryCtaStyle {
    if (_self.primaryCtaStyle == null) {
    return null;
  }

  return $IamCtaButtonStyleCopyWith<$Res>(_self.primaryCtaStyle!, (value) {
    return _then(_self.copyWith(primaryCtaStyle: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamCtaButtonStyleCopyWith<$Res>? get secondaryCtaStyle {
    if (_self.secondaryCtaStyle == null) {
    return null;
  }

  return $IamCtaButtonStyleCopyWith<$Res>(_self.secondaryCtaStyle!, (value) {
    return _then(_self.copyWith(secondaryCtaStyle: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamSizeCopyWith<$Res>? get ctaMinimumSize {
    if (_self.ctaMinimumSize == null) {
    return null;
  }

  return $IamSizeCopyWith<$Res>(_self.ctaMinimumSize!, (value) {
    return _then(_self.copyWith(ctaMinimumSize: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamBorderRadiusCopyWith<$Res>? get ctaBorderRadius {
    if (_self.ctaBorderRadius == null) {
    return null;
  }

  return $IamBorderRadiusCopyWith<$Res>(_self.ctaBorderRadius!, (value) {
    return _then(_self.copyWith(ctaBorderRadius: value));
  });
}
}


/// Adds pattern-matching-related methods to [IamBodyStyle].
extension IamBodyStylePatterns on IamBodyStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamBodyStyle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamBodyStyle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamBodyStyle value)  $default,){
final _that = this;
switch (_that) {
case _IamBodyStyle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamBodyStyle value)?  $default,){
final _that = this;
switch (_that) {
case _IamBodyStyle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IamEdgeInsets? padding,  double? imageBottomSpacing,  double? titleBottomSpacing,  double? bodyBottomSpacing,  double? primaryCtaBottomSpacing,  IamCrossAxisAlignment? crossAxisAlignment,  IamTextAlign? textAlign,  bool? scrollable,  String? backgroundColor,  IamTextStyle? titleStyle,  IamTextStyle? bodyStyle,  IamBoxFit? imageFit,  double? imageHeight,  double? imageWidth,  IamBorderRadius? imageBorderRadius,  bool? showCloseButton,  String? closeIconColor,  String? closeButtonBackgroundColor,  IamAlignment? closeButtonAlignment,  String? closeButtonTooltip,  IamCtaButtonStyle? primaryCtaStyle,  IamCtaButtonStyle? secondaryCtaStyle,  IamSize? ctaMinimumSize,  IamBorderRadius? ctaBorderRadius)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamBodyStyle() when $default != null:
return $default(_that.padding,_that.imageBottomSpacing,_that.titleBottomSpacing,_that.bodyBottomSpacing,_that.primaryCtaBottomSpacing,_that.crossAxisAlignment,_that.textAlign,_that.scrollable,_that.backgroundColor,_that.titleStyle,_that.bodyStyle,_that.imageFit,_that.imageHeight,_that.imageWidth,_that.imageBorderRadius,_that.showCloseButton,_that.closeIconColor,_that.closeButtonBackgroundColor,_that.closeButtonAlignment,_that.closeButtonTooltip,_that.primaryCtaStyle,_that.secondaryCtaStyle,_that.ctaMinimumSize,_that.ctaBorderRadius);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IamEdgeInsets? padding,  double? imageBottomSpacing,  double? titleBottomSpacing,  double? bodyBottomSpacing,  double? primaryCtaBottomSpacing,  IamCrossAxisAlignment? crossAxisAlignment,  IamTextAlign? textAlign,  bool? scrollable,  String? backgroundColor,  IamTextStyle? titleStyle,  IamTextStyle? bodyStyle,  IamBoxFit? imageFit,  double? imageHeight,  double? imageWidth,  IamBorderRadius? imageBorderRadius,  bool? showCloseButton,  String? closeIconColor,  String? closeButtonBackgroundColor,  IamAlignment? closeButtonAlignment,  String? closeButtonTooltip,  IamCtaButtonStyle? primaryCtaStyle,  IamCtaButtonStyle? secondaryCtaStyle,  IamSize? ctaMinimumSize,  IamBorderRadius? ctaBorderRadius)  $default,) {final _that = this;
switch (_that) {
case _IamBodyStyle():
return $default(_that.padding,_that.imageBottomSpacing,_that.titleBottomSpacing,_that.bodyBottomSpacing,_that.primaryCtaBottomSpacing,_that.crossAxisAlignment,_that.textAlign,_that.scrollable,_that.backgroundColor,_that.titleStyle,_that.bodyStyle,_that.imageFit,_that.imageHeight,_that.imageWidth,_that.imageBorderRadius,_that.showCloseButton,_that.closeIconColor,_that.closeButtonBackgroundColor,_that.closeButtonAlignment,_that.closeButtonTooltip,_that.primaryCtaStyle,_that.secondaryCtaStyle,_that.ctaMinimumSize,_that.ctaBorderRadius);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IamEdgeInsets? padding,  double? imageBottomSpacing,  double? titleBottomSpacing,  double? bodyBottomSpacing,  double? primaryCtaBottomSpacing,  IamCrossAxisAlignment? crossAxisAlignment,  IamTextAlign? textAlign,  bool? scrollable,  String? backgroundColor,  IamTextStyle? titleStyle,  IamTextStyle? bodyStyle,  IamBoxFit? imageFit,  double? imageHeight,  double? imageWidth,  IamBorderRadius? imageBorderRadius,  bool? showCloseButton,  String? closeIconColor,  String? closeButtonBackgroundColor,  IamAlignment? closeButtonAlignment,  String? closeButtonTooltip,  IamCtaButtonStyle? primaryCtaStyle,  IamCtaButtonStyle? secondaryCtaStyle,  IamSize? ctaMinimumSize,  IamBorderRadius? ctaBorderRadius)?  $default,) {final _that = this;
switch (_that) {
case _IamBodyStyle() when $default != null:
return $default(_that.padding,_that.imageBottomSpacing,_that.titleBottomSpacing,_that.bodyBottomSpacing,_that.primaryCtaBottomSpacing,_that.crossAxisAlignment,_that.textAlign,_that.scrollable,_that.backgroundColor,_that.titleStyle,_that.bodyStyle,_that.imageFit,_that.imageHeight,_that.imageWidth,_that.imageBorderRadius,_that.showCloseButton,_that.closeIconColor,_that.closeButtonBackgroundColor,_that.closeButtonAlignment,_that.closeButtonTooltip,_that.primaryCtaStyle,_that.secondaryCtaStyle,_that.ctaMinimumSize,_that.ctaBorderRadius);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamBodyStyle implements IamBodyStyle {
  const _IamBodyStyle({this.padding, this.imageBottomSpacing, this.titleBottomSpacing, this.bodyBottomSpacing, this.primaryCtaBottomSpacing, this.crossAxisAlignment, this.textAlign, this.scrollable, this.backgroundColor, this.titleStyle, this.bodyStyle, this.imageFit, this.imageHeight, this.imageWidth, this.imageBorderRadius, this.showCloseButton, this.closeIconColor, this.closeButtonBackgroundColor, this.closeButtonAlignment, this.closeButtonTooltip, this.primaryCtaStyle, this.secondaryCtaStyle, this.ctaMinimumSize, this.ctaBorderRadius});
  factory _IamBodyStyle.fromJson(Map<String, dynamic> json) => _$IamBodyStyleFromJson(json);

// Layout / spacing
@override final  IamEdgeInsets? padding;
@override final  double? imageBottomSpacing;
@override final  double? titleBottomSpacing;
@override final  double? bodyBottomSpacing;
@override final  double? primaryCtaBottomSpacing;
@override final  IamCrossAxisAlignment? crossAxisAlignment;
@override final  IamTextAlign? textAlign;
@override final  bool? scrollable;
// Background
@override final  String? backgroundColor;
// Text styles
@override final  IamTextStyle? titleStyle;
@override final  IamTextStyle? bodyStyle;
// Image
@override final  IamBoxFit? imageFit;
@override final  double? imageHeight;
@override final  double? imageWidth;
@override final  IamBorderRadius? imageBorderRadius;
// Close button
@override final  bool? showCloseButton;
@override final  String? closeIconColor;
@override final  String? closeButtonBackgroundColor;
@override final  IamAlignment? closeButtonAlignment;
@override final  String? closeButtonTooltip;
// CTA passthrough
@override final  IamCtaButtonStyle? primaryCtaStyle;
@override final  IamCtaButtonStyle? secondaryCtaStyle;
@override final  IamSize? ctaMinimumSize;
@override final  IamBorderRadius? ctaBorderRadius;

/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamBodyStyleCopyWith<_IamBodyStyle> get copyWith => __$IamBodyStyleCopyWithImpl<_IamBodyStyle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamBodyStyleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamBodyStyle&&(identical(other.padding, padding) || other.padding == padding)&&(identical(other.imageBottomSpacing, imageBottomSpacing) || other.imageBottomSpacing == imageBottomSpacing)&&(identical(other.titleBottomSpacing, titleBottomSpacing) || other.titleBottomSpacing == titleBottomSpacing)&&(identical(other.bodyBottomSpacing, bodyBottomSpacing) || other.bodyBottomSpacing == bodyBottomSpacing)&&(identical(other.primaryCtaBottomSpacing, primaryCtaBottomSpacing) || other.primaryCtaBottomSpacing == primaryCtaBottomSpacing)&&(identical(other.crossAxisAlignment, crossAxisAlignment) || other.crossAxisAlignment == crossAxisAlignment)&&(identical(other.textAlign, textAlign) || other.textAlign == textAlign)&&(identical(other.scrollable, scrollable) || other.scrollable == scrollable)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.titleStyle, titleStyle) || other.titleStyle == titleStyle)&&(identical(other.bodyStyle, bodyStyle) || other.bodyStyle == bodyStyle)&&(identical(other.imageFit, imageFit) || other.imageFit == imageFit)&&(identical(other.imageHeight, imageHeight) || other.imageHeight == imageHeight)&&(identical(other.imageWidth, imageWidth) || other.imageWidth == imageWidth)&&(identical(other.imageBorderRadius, imageBorderRadius) || other.imageBorderRadius == imageBorderRadius)&&(identical(other.showCloseButton, showCloseButton) || other.showCloseButton == showCloseButton)&&(identical(other.closeIconColor, closeIconColor) || other.closeIconColor == closeIconColor)&&(identical(other.closeButtonBackgroundColor, closeButtonBackgroundColor) || other.closeButtonBackgroundColor == closeButtonBackgroundColor)&&(identical(other.closeButtonAlignment, closeButtonAlignment) || other.closeButtonAlignment == closeButtonAlignment)&&(identical(other.closeButtonTooltip, closeButtonTooltip) || other.closeButtonTooltip == closeButtonTooltip)&&(identical(other.primaryCtaStyle, primaryCtaStyle) || other.primaryCtaStyle == primaryCtaStyle)&&(identical(other.secondaryCtaStyle, secondaryCtaStyle) || other.secondaryCtaStyle == secondaryCtaStyle)&&(identical(other.ctaMinimumSize, ctaMinimumSize) || other.ctaMinimumSize == ctaMinimumSize)&&(identical(other.ctaBorderRadius, ctaBorderRadius) || other.ctaBorderRadius == ctaBorderRadius));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,padding,imageBottomSpacing,titleBottomSpacing,bodyBottomSpacing,primaryCtaBottomSpacing,crossAxisAlignment,textAlign,scrollable,backgroundColor,titleStyle,bodyStyle,imageFit,imageHeight,imageWidth,imageBorderRadius,showCloseButton,closeIconColor,closeButtonBackgroundColor,closeButtonAlignment,closeButtonTooltip,primaryCtaStyle,secondaryCtaStyle,ctaMinimumSize,ctaBorderRadius]);

@override
String toString() {
  return 'IamBodyStyle(padding: $padding, imageBottomSpacing: $imageBottomSpacing, titleBottomSpacing: $titleBottomSpacing, bodyBottomSpacing: $bodyBottomSpacing, primaryCtaBottomSpacing: $primaryCtaBottomSpacing, crossAxisAlignment: $crossAxisAlignment, textAlign: $textAlign, scrollable: $scrollable, backgroundColor: $backgroundColor, titleStyle: $titleStyle, bodyStyle: $bodyStyle, imageFit: $imageFit, imageHeight: $imageHeight, imageWidth: $imageWidth, imageBorderRadius: $imageBorderRadius, showCloseButton: $showCloseButton, closeIconColor: $closeIconColor, closeButtonBackgroundColor: $closeButtonBackgroundColor, closeButtonAlignment: $closeButtonAlignment, closeButtonTooltip: $closeButtonTooltip, primaryCtaStyle: $primaryCtaStyle, secondaryCtaStyle: $secondaryCtaStyle, ctaMinimumSize: $ctaMinimumSize, ctaBorderRadius: $ctaBorderRadius)';
}


}

/// @nodoc
abstract mixin class _$IamBodyStyleCopyWith<$Res> implements $IamBodyStyleCopyWith<$Res> {
  factory _$IamBodyStyleCopyWith(_IamBodyStyle value, $Res Function(_IamBodyStyle) _then) = __$IamBodyStyleCopyWithImpl;
@override @useResult
$Res call({
 IamEdgeInsets? padding, double? imageBottomSpacing, double? titleBottomSpacing, double? bodyBottomSpacing, double? primaryCtaBottomSpacing, IamCrossAxisAlignment? crossAxisAlignment, IamTextAlign? textAlign, bool? scrollable, String? backgroundColor, IamTextStyle? titleStyle, IamTextStyle? bodyStyle, IamBoxFit? imageFit, double? imageHeight, double? imageWidth, IamBorderRadius? imageBorderRadius, bool? showCloseButton, String? closeIconColor, String? closeButtonBackgroundColor, IamAlignment? closeButtonAlignment, String? closeButtonTooltip, IamCtaButtonStyle? primaryCtaStyle, IamCtaButtonStyle? secondaryCtaStyle, IamSize? ctaMinimumSize, IamBorderRadius? ctaBorderRadius
});


@override $IamEdgeInsetsCopyWith<$Res>? get padding;@override $IamTextStyleCopyWith<$Res>? get titleStyle;@override $IamTextStyleCopyWith<$Res>? get bodyStyle;@override $IamBorderRadiusCopyWith<$Res>? get imageBorderRadius;@override $IamAlignmentCopyWith<$Res>? get closeButtonAlignment;@override $IamCtaButtonStyleCopyWith<$Res>? get primaryCtaStyle;@override $IamCtaButtonStyleCopyWith<$Res>? get secondaryCtaStyle;@override $IamSizeCopyWith<$Res>? get ctaMinimumSize;@override $IamBorderRadiusCopyWith<$Res>? get ctaBorderRadius;

}
/// @nodoc
class __$IamBodyStyleCopyWithImpl<$Res>
    implements _$IamBodyStyleCopyWith<$Res> {
  __$IamBodyStyleCopyWithImpl(this._self, this._then);

  final _IamBodyStyle _self;
  final $Res Function(_IamBodyStyle) _then;

/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? padding = freezed,Object? imageBottomSpacing = freezed,Object? titleBottomSpacing = freezed,Object? bodyBottomSpacing = freezed,Object? primaryCtaBottomSpacing = freezed,Object? crossAxisAlignment = freezed,Object? textAlign = freezed,Object? scrollable = freezed,Object? backgroundColor = freezed,Object? titleStyle = freezed,Object? bodyStyle = freezed,Object? imageFit = freezed,Object? imageHeight = freezed,Object? imageWidth = freezed,Object? imageBorderRadius = freezed,Object? showCloseButton = freezed,Object? closeIconColor = freezed,Object? closeButtonBackgroundColor = freezed,Object? closeButtonAlignment = freezed,Object? closeButtonTooltip = freezed,Object? primaryCtaStyle = freezed,Object? secondaryCtaStyle = freezed,Object? ctaMinimumSize = freezed,Object? ctaBorderRadius = freezed,}) {
  return _then(_IamBodyStyle(
padding: freezed == padding ? _self.padding : padding // ignore: cast_nullable_to_non_nullable
as IamEdgeInsets?,imageBottomSpacing: freezed == imageBottomSpacing ? _self.imageBottomSpacing : imageBottomSpacing // ignore: cast_nullable_to_non_nullable
as double?,titleBottomSpacing: freezed == titleBottomSpacing ? _self.titleBottomSpacing : titleBottomSpacing // ignore: cast_nullable_to_non_nullable
as double?,bodyBottomSpacing: freezed == bodyBottomSpacing ? _self.bodyBottomSpacing : bodyBottomSpacing // ignore: cast_nullable_to_non_nullable
as double?,primaryCtaBottomSpacing: freezed == primaryCtaBottomSpacing ? _self.primaryCtaBottomSpacing : primaryCtaBottomSpacing // ignore: cast_nullable_to_non_nullable
as double?,crossAxisAlignment: freezed == crossAxisAlignment ? _self.crossAxisAlignment : crossAxisAlignment // ignore: cast_nullable_to_non_nullable
as IamCrossAxisAlignment?,textAlign: freezed == textAlign ? _self.textAlign : textAlign // ignore: cast_nullable_to_non_nullable
as IamTextAlign?,scrollable: freezed == scrollable ? _self.scrollable : scrollable // ignore: cast_nullable_to_non_nullable
as bool?,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String?,titleStyle: freezed == titleStyle ? _self.titleStyle : titleStyle // ignore: cast_nullable_to_non_nullable
as IamTextStyle?,bodyStyle: freezed == bodyStyle ? _self.bodyStyle : bodyStyle // ignore: cast_nullable_to_non_nullable
as IamTextStyle?,imageFit: freezed == imageFit ? _self.imageFit : imageFit // ignore: cast_nullable_to_non_nullable
as IamBoxFit?,imageHeight: freezed == imageHeight ? _self.imageHeight : imageHeight // ignore: cast_nullable_to_non_nullable
as double?,imageWidth: freezed == imageWidth ? _self.imageWidth : imageWidth // ignore: cast_nullable_to_non_nullable
as double?,imageBorderRadius: freezed == imageBorderRadius ? _self.imageBorderRadius : imageBorderRadius // ignore: cast_nullable_to_non_nullable
as IamBorderRadius?,showCloseButton: freezed == showCloseButton ? _self.showCloseButton : showCloseButton // ignore: cast_nullable_to_non_nullable
as bool?,closeIconColor: freezed == closeIconColor ? _self.closeIconColor : closeIconColor // ignore: cast_nullable_to_non_nullable
as String?,closeButtonBackgroundColor: freezed == closeButtonBackgroundColor ? _self.closeButtonBackgroundColor : closeButtonBackgroundColor // ignore: cast_nullable_to_non_nullable
as String?,closeButtonAlignment: freezed == closeButtonAlignment ? _self.closeButtonAlignment : closeButtonAlignment // ignore: cast_nullable_to_non_nullable
as IamAlignment?,closeButtonTooltip: freezed == closeButtonTooltip ? _self.closeButtonTooltip : closeButtonTooltip // ignore: cast_nullable_to_non_nullable
as String?,primaryCtaStyle: freezed == primaryCtaStyle ? _self.primaryCtaStyle : primaryCtaStyle // ignore: cast_nullable_to_non_nullable
as IamCtaButtonStyle?,secondaryCtaStyle: freezed == secondaryCtaStyle ? _self.secondaryCtaStyle : secondaryCtaStyle // ignore: cast_nullable_to_non_nullable
as IamCtaButtonStyle?,ctaMinimumSize: freezed == ctaMinimumSize ? _self.ctaMinimumSize : ctaMinimumSize // ignore: cast_nullable_to_non_nullable
as IamSize?,ctaBorderRadius: freezed == ctaBorderRadius ? _self.ctaBorderRadius : ctaBorderRadius // ignore: cast_nullable_to_non_nullable
as IamBorderRadius?,
  ));
}

/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamEdgeInsetsCopyWith<$Res>? get padding {
    if (_self.padding == null) {
    return null;
  }

  return $IamEdgeInsetsCopyWith<$Res>(_self.padding!, (value) {
    return _then(_self.copyWith(padding: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamTextStyleCopyWith<$Res>? get titleStyle {
    if (_self.titleStyle == null) {
    return null;
  }

  return $IamTextStyleCopyWith<$Res>(_self.titleStyle!, (value) {
    return _then(_self.copyWith(titleStyle: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamTextStyleCopyWith<$Res>? get bodyStyle {
    if (_self.bodyStyle == null) {
    return null;
  }

  return $IamTextStyleCopyWith<$Res>(_self.bodyStyle!, (value) {
    return _then(_self.copyWith(bodyStyle: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamBorderRadiusCopyWith<$Res>? get imageBorderRadius {
    if (_self.imageBorderRadius == null) {
    return null;
  }

  return $IamBorderRadiusCopyWith<$Res>(_self.imageBorderRadius!, (value) {
    return _then(_self.copyWith(imageBorderRadius: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamAlignmentCopyWith<$Res>? get closeButtonAlignment {
    if (_self.closeButtonAlignment == null) {
    return null;
  }

  return $IamAlignmentCopyWith<$Res>(_self.closeButtonAlignment!, (value) {
    return _then(_self.copyWith(closeButtonAlignment: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamCtaButtonStyleCopyWith<$Res>? get primaryCtaStyle {
    if (_self.primaryCtaStyle == null) {
    return null;
  }

  return $IamCtaButtonStyleCopyWith<$Res>(_self.primaryCtaStyle!, (value) {
    return _then(_self.copyWith(primaryCtaStyle: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamCtaButtonStyleCopyWith<$Res>? get secondaryCtaStyle {
    if (_self.secondaryCtaStyle == null) {
    return null;
  }

  return $IamCtaButtonStyleCopyWith<$Res>(_self.secondaryCtaStyle!, (value) {
    return _then(_self.copyWith(secondaryCtaStyle: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamSizeCopyWith<$Res>? get ctaMinimumSize {
    if (_self.ctaMinimumSize == null) {
    return null;
  }

  return $IamSizeCopyWith<$Res>(_self.ctaMinimumSize!, (value) {
    return _then(_self.copyWith(ctaMinimumSize: value));
  });
}/// Create a copy of IamBodyStyle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamBorderRadiusCopyWith<$Res>? get ctaBorderRadius {
    if (_self.ctaBorderRadius == null) {
    return null;
  }

  return $IamBorderRadiusCopyWith<$Res>(_self.ctaBorderRadius!, (value) {
    return _then(_self.copyWith(ctaBorderRadius: value));
  });
}
}

// dart format on
