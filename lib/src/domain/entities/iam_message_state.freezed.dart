// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iam_message_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IamMessageState {

 int get impressions; DateTime? get lastShownAt; bool get dismissed; bool get ctaClicked; int? get stickyVariantIndex;
/// Create a copy of IamMessageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamMessageStateCopyWith<IamMessageState> get copyWith => _$IamMessageStateCopyWithImpl<IamMessageState>(this as IamMessageState, _$identity);

  /// Serializes this IamMessageState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamMessageState&&(identical(other.impressions, impressions) || other.impressions == impressions)&&(identical(other.lastShownAt, lastShownAt) || other.lastShownAt == lastShownAt)&&(identical(other.dismissed, dismissed) || other.dismissed == dismissed)&&(identical(other.ctaClicked, ctaClicked) || other.ctaClicked == ctaClicked)&&(identical(other.stickyVariantIndex, stickyVariantIndex) || other.stickyVariantIndex == stickyVariantIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,impressions,lastShownAt,dismissed,ctaClicked,stickyVariantIndex);

@override
String toString() {
  return 'IamMessageState(impressions: $impressions, lastShownAt: $lastShownAt, dismissed: $dismissed, ctaClicked: $ctaClicked, stickyVariantIndex: $stickyVariantIndex)';
}


}

/// @nodoc
abstract mixin class $IamMessageStateCopyWith<$Res>  {
  factory $IamMessageStateCopyWith(IamMessageState value, $Res Function(IamMessageState) _then) = _$IamMessageStateCopyWithImpl;
@useResult
$Res call({
 int impressions, DateTime? lastShownAt, bool dismissed, bool ctaClicked, int? stickyVariantIndex
});




}
/// @nodoc
class _$IamMessageStateCopyWithImpl<$Res>
    implements $IamMessageStateCopyWith<$Res> {
  _$IamMessageStateCopyWithImpl(this._self, this._then);

  final IamMessageState _self;
  final $Res Function(IamMessageState) _then;

/// Create a copy of IamMessageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? impressions = null,Object? lastShownAt = freezed,Object? dismissed = null,Object? ctaClicked = null,Object? stickyVariantIndex = freezed,}) {
  return _then(_self.copyWith(
impressions: null == impressions ? _self.impressions : impressions // ignore: cast_nullable_to_non_nullable
as int,lastShownAt: freezed == lastShownAt ? _self.lastShownAt : lastShownAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dismissed: null == dismissed ? _self.dismissed : dismissed // ignore: cast_nullable_to_non_nullable
as bool,ctaClicked: null == ctaClicked ? _self.ctaClicked : ctaClicked // ignore: cast_nullable_to_non_nullable
as bool,stickyVariantIndex: freezed == stickyVariantIndex ? _self.stickyVariantIndex : stickyVariantIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [IamMessageState].
extension IamMessageStatePatterns on IamMessageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamMessageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamMessageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamMessageState value)  $default,){
final _that = this;
switch (_that) {
case _IamMessageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamMessageState value)?  $default,){
final _that = this;
switch (_that) {
case _IamMessageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int impressions,  DateTime? lastShownAt,  bool dismissed,  bool ctaClicked,  int? stickyVariantIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamMessageState() when $default != null:
return $default(_that.impressions,_that.lastShownAt,_that.dismissed,_that.ctaClicked,_that.stickyVariantIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int impressions,  DateTime? lastShownAt,  bool dismissed,  bool ctaClicked,  int? stickyVariantIndex)  $default,) {final _that = this;
switch (_that) {
case _IamMessageState():
return $default(_that.impressions,_that.lastShownAt,_that.dismissed,_that.ctaClicked,_that.stickyVariantIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int impressions,  DateTime? lastShownAt,  bool dismissed,  bool ctaClicked,  int? stickyVariantIndex)?  $default,) {final _that = this;
switch (_that) {
case _IamMessageState() when $default != null:
return $default(_that.impressions,_that.lastShownAt,_that.dismissed,_that.ctaClicked,_that.stickyVariantIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamMessageState implements IamMessageState {
  const _IamMessageState({this.impressions = 0, this.lastShownAt, this.dismissed = false, this.ctaClicked = false, this.stickyVariantIndex});
  factory _IamMessageState.fromJson(Map<String, dynamic> json) => _$IamMessageStateFromJson(json);

@override@JsonKey() final  int impressions;
@override final  DateTime? lastShownAt;
@override@JsonKey() final  bool dismissed;
@override@JsonKey() final  bool ctaClicked;
@override final  int? stickyVariantIndex;

/// Create a copy of IamMessageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamMessageStateCopyWith<_IamMessageState> get copyWith => __$IamMessageStateCopyWithImpl<_IamMessageState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamMessageStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamMessageState&&(identical(other.impressions, impressions) || other.impressions == impressions)&&(identical(other.lastShownAt, lastShownAt) || other.lastShownAt == lastShownAt)&&(identical(other.dismissed, dismissed) || other.dismissed == dismissed)&&(identical(other.ctaClicked, ctaClicked) || other.ctaClicked == ctaClicked)&&(identical(other.stickyVariantIndex, stickyVariantIndex) || other.stickyVariantIndex == stickyVariantIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,impressions,lastShownAt,dismissed,ctaClicked,stickyVariantIndex);

@override
String toString() {
  return 'IamMessageState(impressions: $impressions, lastShownAt: $lastShownAt, dismissed: $dismissed, ctaClicked: $ctaClicked, stickyVariantIndex: $stickyVariantIndex)';
}


}

/// @nodoc
abstract mixin class _$IamMessageStateCopyWith<$Res> implements $IamMessageStateCopyWith<$Res> {
  factory _$IamMessageStateCopyWith(_IamMessageState value, $Res Function(_IamMessageState) _then) = __$IamMessageStateCopyWithImpl;
@override @useResult
$Res call({
 int impressions, DateTime? lastShownAt, bool dismissed, bool ctaClicked, int? stickyVariantIndex
});




}
/// @nodoc
class __$IamMessageStateCopyWithImpl<$Res>
    implements _$IamMessageStateCopyWith<$Res> {
  __$IamMessageStateCopyWithImpl(this._self, this._then);

  final _IamMessageState _self;
  final $Res Function(_IamMessageState) _then;

/// Create a copy of IamMessageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? impressions = null,Object? lastShownAt = freezed,Object? dismissed = null,Object? ctaClicked = null,Object? stickyVariantIndex = freezed,}) {
  return _then(_IamMessageState(
impressions: null == impressions ? _self.impressions : impressions // ignore: cast_nullable_to_non_nullable
as int,lastShownAt: freezed == lastShownAt ? _self.lastShownAt : lastShownAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dismissed: null == dismissed ? _self.dismissed : dismissed // ignore: cast_nullable_to_non_nullable
as bool,ctaClicked: null == ctaClicked ? _self.ctaClicked : ctaClicked // ignore: cast_nullable_to_non_nullable
as bool,stickyVariantIndex: freezed == stickyVariantIndex ? _self.stickyVariantIndex : stickyVariantIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
