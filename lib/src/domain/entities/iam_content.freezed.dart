// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iam_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IamContent {

 String get title; String get body; String? get imageUrl; IamCta? get primaryCta; IamCta? get secondaryCta; String? get backgroundColor; String? get textColor;/// Optional visual overrides for the `IamBody` widget, shipped in the
/// remote JSON payload.
///
/// Values defined here are used as defaults when the widget-level
/// parameters on `IamBody` are not provided. Widget-level params always
/// win.
 IamBodyStyle? get style;
/// Create a copy of IamContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamContentCopyWith<IamContent> get copyWith => _$IamContentCopyWithImpl<IamContent>(this as IamContent, _$identity);

  /// Serializes this IamContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamContent&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.primaryCta, primaryCta) || other.primaryCta == primaryCta)&&(identical(other.secondaryCta, secondaryCta) || other.secondaryCta == secondaryCta)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,body,imageUrl,primaryCta,secondaryCta,backgroundColor,textColor,style);

@override
String toString() {
  return 'IamContent(title: $title, body: $body, imageUrl: $imageUrl, primaryCta: $primaryCta, secondaryCta: $secondaryCta, backgroundColor: $backgroundColor, textColor: $textColor, style: $style)';
}


}

/// @nodoc
abstract mixin class $IamContentCopyWith<$Res>  {
  factory $IamContentCopyWith(IamContent value, $Res Function(IamContent) _then) = _$IamContentCopyWithImpl;
@useResult
$Res call({
 String title, String body, String? imageUrl, IamCta? primaryCta, IamCta? secondaryCta, String? backgroundColor, String? textColor, IamBodyStyle? style
});


$IamCtaCopyWith<$Res>? get primaryCta;$IamCtaCopyWith<$Res>? get secondaryCta;$IamBodyStyleCopyWith<$Res>? get style;

}
/// @nodoc
class _$IamContentCopyWithImpl<$Res>
    implements $IamContentCopyWith<$Res> {
  _$IamContentCopyWithImpl(this._self, this._then);

  final IamContent _self;
  final $Res Function(IamContent) _then;

/// Create a copy of IamContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? body = null,Object? imageUrl = freezed,Object? primaryCta = freezed,Object? secondaryCta = freezed,Object? backgroundColor = freezed,Object? textColor = freezed,Object? style = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,primaryCta: freezed == primaryCta ? _self.primaryCta : primaryCta // ignore: cast_nullable_to_non_nullable
as IamCta?,secondaryCta: freezed == secondaryCta ? _self.secondaryCta : secondaryCta // ignore: cast_nullable_to_non_nullable
as IamCta?,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String?,textColor: freezed == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as IamBodyStyle?,
  ));
}
/// Create a copy of IamContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamCtaCopyWith<$Res>? get primaryCta {
    if (_self.primaryCta == null) {
    return null;
  }

  return $IamCtaCopyWith<$Res>(_self.primaryCta!, (value) {
    return _then(_self.copyWith(primaryCta: value));
  });
}/// Create a copy of IamContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamCtaCopyWith<$Res>? get secondaryCta {
    if (_self.secondaryCta == null) {
    return null;
  }

  return $IamCtaCopyWith<$Res>(_self.secondaryCta!, (value) {
    return _then(_self.copyWith(secondaryCta: value));
  });
}/// Create a copy of IamContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamBodyStyleCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $IamBodyStyleCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}


/// Adds pattern-matching-related methods to [IamContent].
extension IamContentPatterns on IamContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IamContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IamContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IamContent value)  $default,){
final _that = this;
switch (_that) {
case _IamContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IamContent value)?  $default,){
final _that = this;
switch (_that) {
case _IamContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String body,  String? imageUrl,  IamCta? primaryCta,  IamCta? secondaryCta,  String? backgroundColor,  String? textColor,  IamBodyStyle? style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IamContent() when $default != null:
return $default(_that.title,_that.body,_that.imageUrl,_that.primaryCta,_that.secondaryCta,_that.backgroundColor,_that.textColor,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String body,  String? imageUrl,  IamCta? primaryCta,  IamCta? secondaryCta,  String? backgroundColor,  String? textColor,  IamBodyStyle? style)  $default,) {final _that = this;
switch (_that) {
case _IamContent():
return $default(_that.title,_that.body,_that.imageUrl,_that.primaryCta,_that.secondaryCta,_that.backgroundColor,_that.textColor,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String body,  String? imageUrl,  IamCta? primaryCta,  IamCta? secondaryCta,  String? backgroundColor,  String? textColor,  IamBodyStyle? style)?  $default,) {final _that = this;
switch (_that) {
case _IamContent() when $default != null:
return $default(_that.title,_that.body,_that.imageUrl,_that.primaryCta,_that.secondaryCta,_that.backgroundColor,_that.textColor,_that.style);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IamContent implements IamContent {
  const _IamContent({this.title = '', this.body = '', this.imageUrl, this.primaryCta, this.secondaryCta, this.backgroundColor, this.textColor, this.style});
  factory _IamContent.fromJson(Map<String, dynamic> json) => _$IamContentFromJson(json);

@override@JsonKey() final  String title;
@override@JsonKey() final  String body;
@override final  String? imageUrl;
@override final  IamCta? primaryCta;
@override final  IamCta? secondaryCta;
@override final  String? backgroundColor;
@override final  String? textColor;
/// Optional visual overrides for the `IamBody` widget, shipped in the
/// remote JSON payload.
///
/// Values defined here are used as defaults when the widget-level
/// parameters on `IamBody` are not provided. Widget-level params always
/// win.
@override final  IamBodyStyle? style;

/// Create a copy of IamContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IamContentCopyWith<_IamContent> get copyWith => __$IamContentCopyWithImpl<_IamContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IamContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IamContent&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.primaryCta, primaryCta) || other.primaryCta == primaryCta)&&(identical(other.secondaryCta, secondaryCta) || other.secondaryCta == secondaryCta)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,body,imageUrl,primaryCta,secondaryCta,backgroundColor,textColor,style);

@override
String toString() {
  return 'IamContent(title: $title, body: $body, imageUrl: $imageUrl, primaryCta: $primaryCta, secondaryCta: $secondaryCta, backgroundColor: $backgroundColor, textColor: $textColor, style: $style)';
}


}

/// @nodoc
abstract mixin class _$IamContentCopyWith<$Res> implements $IamContentCopyWith<$Res> {
  factory _$IamContentCopyWith(_IamContent value, $Res Function(_IamContent) _then) = __$IamContentCopyWithImpl;
@override @useResult
$Res call({
 String title, String body, String? imageUrl, IamCta? primaryCta, IamCta? secondaryCta, String? backgroundColor, String? textColor, IamBodyStyle? style
});


@override $IamCtaCopyWith<$Res>? get primaryCta;@override $IamCtaCopyWith<$Res>? get secondaryCta;@override $IamBodyStyleCopyWith<$Res>? get style;

}
/// @nodoc
class __$IamContentCopyWithImpl<$Res>
    implements _$IamContentCopyWith<$Res> {
  __$IamContentCopyWithImpl(this._self, this._then);

  final _IamContent _self;
  final $Res Function(_IamContent) _then;

/// Create a copy of IamContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? body = null,Object? imageUrl = freezed,Object? primaryCta = freezed,Object? secondaryCta = freezed,Object? backgroundColor = freezed,Object? textColor = freezed,Object? style = freezed,}) {
  return _then(_IamContent(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,primaryCta: freezed == primaryCta ? _self.primaryCta : primaryCta // ignore: cast_nullable_to_non_nullable
as IamCta?,secondaryCta: freezed == secondaryCta ? _self.secondaryCta : secondaryCta // ignore: cast_nullable_to_non_nullable
as IamCta?,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String?,textColor: freezed == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as IamBodyStyle?,
  ));
}

/// Create a copy of IamContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamCtaCopyWith<$Res>? get primaryCta {
    if (_self.primaryCta == null) {
    return null;
  }

  return $IamCtaCopyWith<$Res>(_self.primaryCta!, (value) {
    return _then(_self.copyWith(primaryCta: value));
  });
}/// Create a copy of IamContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamCtaCopyWith<$Res>? get secondaryCta {
    if (_self.secondaryCta == null) {
    return null;
  }

  return $IamCtaCopyWith<$Res>(_self.secondaryCta!, (value) {
    return _then(_self.copyWith(secondaryCta: value));
  });
}/// Create a copy of IamContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamBodyStyleCopyWith<$Res>? get style {
    if (_self.style == null) {
    return null;
  }

  return $IamBodyStyleCopyWith<$Res>(_self.style!, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}

// dart format on
