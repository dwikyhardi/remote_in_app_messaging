// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iam_cta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IamCta {

 String get label; IamActionType get action; String? get url;/// Optional per-CTA visual overrides, shipped in the remote JSON payload.
///
/// Values defined here are used as defaults when the widget-level
/// parameters on `IamCtaButton` are not provided. Widget-level params
/// always win.
 IamCtaButtonStyle? get style;
/// Create a copy of IamCta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamCtaCopyWith<IamCta> get copyWith => _$IamCtaCopyWithImpl<IamCta>(this as IamCta, _$identity);

  /// Serializes this IamCta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamCta&&(identical(other.label, label) || other.label == label)&&(identical(other.action, action) || other.action == action)&&(identical(other.url, url) || other.url == url)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,action,url,style);

@override
String toString() {
  return 'IamCta(label: $label, action: $action, url: $url, style: $style)';
}


}

/// @nodoc
abstract mixin class $IamCtaCopyWith<$Res>  {
  factory $IamCtaCopyWith(IamCta value, $Res Function(IamCta) _then) = _$IamCtaCopyWithImpl;
@useResult
$Res call({
 String label, IamActionType action, String? url, IamCtaButtonStyle? style
});


$IamCtaButtonStyleCopyWith<$Res>? get style;

}
/// @nodoc
class _$IamCtaCopyWithImpl<$Res>
    implements $IamCtaCopyWith<$Res> {
  _$IamCtaCopyWithImpl(this._self, this._then);

  final IamCta _self;
  final $Res Function(IamCta) _then;

/// Create a copy of IamCta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? action = null,Object? url = freezed,Object? style = freezed,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as IamActionType,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as IamCtaButtonStyle?,
  ));
}
/// Create a copy of IamCta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamCtaButtonStyleCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $IamCtaButtonStyleCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}


/// Adds pattern-matching-related methods to [IamCta].
extension IamCtaPatterns on IamCta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamCta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamCta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamCta value)  $default,){
final _that = this;
switch (_that) {
case _IamCta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamCta value)?  $default,){
final _that = this;
switch (_that) {
case _IamCta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  IamActionType action,  String? url,  IamCtaButtonStyle? style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamCta() when $default != null:
return $default(_that.label,_that.action,_that.url,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  IamActionType action,  String? url,  IamCtaButtonStyle? style)  $default,) {final _that = this;
switch (_that) {
case _IamCta():
return $default(_that.label,_that.action,_that.url,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  IamActionType action,  String? url,  IamCtaButtonStyle? style)?  $default,) {final _that = this;
switch (_that) {
case _IamCta() when $default != null:
return $default(_that.label,_that.action,_that.url,_that.style);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamCta implements IamCta {
  const _IamCta({this.label = '', this.action = IamActionType.close, this.url, this.style});
  factory _IamCta.fromJson(Map<String, dynamic> json) => _$IamCtaFromJson(json);

@override@JsonKey() final  String label;
@override@JsonKey() final  IamActionType action;
@override final  String? url;
/// Optional per-CTA visual overrides, shipped in the remote JSON payload.
///
/// Values defined here are used as defaults when the widget-level
/// parameters on `IamCtaButton` are not provided. Widget-level params
/// always win.
@override final  IamCtaButtonStyle? style;

/// Create a copy of IamCta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamCtaCopyWith<_IamCta> get copyWith => __$IamCtaCopyWithImpl<_IamCta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamCtaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamCta&&(identical(other.label, label) || other.label == label)&&(identical(other.action, action) || other.action == action)&&(identical(other.url, url) || other.url == url)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,action,url,style);

@override
String toString() {
  return 'IamCta(label: $label, action: $action, url: $url, style: $style)';
}


}

/// @nodoc
abstract mixin class _$IamCtaCopyWith<$Res> implements $IamCtaCopyWith<$Res> {
  factory _$IamCtaCopyWith(_IamCta value, $Res Function(_IamCta) _then) = __$IamCtaCopyWithImpl;
@override @useResult
$Res call({
 String label, IamActionType action, String? url, IamCtaButtonStyle? style
});


@override $IamCtaButtonStyleCopyWith<$Res>? get style;

}
/// @nodoc
class __$IamCtaCopyWithImpl<$Res>
    implements _$IamCtaCopyWith<$Res> {
  __$IamCtaCopyWithImpl(this._self, this._then);

  final _IamCta _self;
  final $Res Function(_IamCta) _then;

/// Create a copy of IamCta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? action = null,Object? url = freezed,Object? style = freezed,}) {
  return _then(_IamCta(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as IamActionType,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as IamCtaButtonStyle?,
  ));
}

/// Create a copy of IamCta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamCtaButtonStyleCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $IamCtaButtonStyleCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}

// dart format on
