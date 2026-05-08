// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iam_trigger_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IamTriggerContext {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamTriggerContext);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IamTriggerContext()';
}


}

/// @nodoc
class $IamTriggerContextCopyWith<$Res>  {
$IamTriggerContextCopyWith(IamTriggerContext _, $Res Function(IamTriggerContext) __);
}


/// Adds pattern-matching-related methods to [IamTriggerContext].
extension IamTriggerContextPatterns on IamTriggerContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IamTriggerLaunch value)?  launch,TResult Function( IamTriggerRoute value)?  route,TResult Function( IamTriggerEvent value)?  event,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IamTriggerLaunch() when launch != null:
return launch(_that);case IamTriggerRoute() when route != null:
return route(_that);case IamTriggerEvent() when event != null:
return event(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IamTriggerLaunch value)  launch,required TResult Function( IamTriggerRoute value)  route,required TResult Function( IamTriggerEvent value)  event,}){
final _that = this;
switch (_that) {
case IamTriggerLaunch():
return launch(_that);case IamTriggerRoute():
return route(_that);case IamTriggerEvent():
return event(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IamTriggerLaunch value)?  launch,TResult? Function( IamTriggerRoute value)?  route,TResult? Function( IamTriggerEvent value)?  event,}){
final _that = this;
switch (_that) {
case IamTriggerLaunch() when launch != null:
return launch(_that);case IamTriggerRoute() when route != null:
return route(_that);case IamTriggerEvent() when event != null:
return event(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  launch,TResult Function( String path)?  route,TResult Function( String name,  Map<String, dynamic> params)?  event,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IamTriggerLaunch() when launch != null:
return launch();case IamTriggerRoute() when route != null:
return route(_that.path);case IamTriggerEvent() when event != null:
return event(_that.name,_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  launch,required TResult Function( String path)  route,required TResult Function( String name,  Map<String, dynamic> params)  event,}) {final _that = this;
switch (_that) {
case IamTriggerLaunch():
return launch();case IamTriggerRoute():
return route(_that.path);case IamTriggerEvent():
return event(_that.name,_that.params);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  launch,TResult? Function( String path)?  route,TResult? Function( String name,  Map<String, dynamic> params)?  event,}) {final _that = this;
switch (_that) {
case IamTriggerLaunch() when launch != null:
return launch();case IamTriggerRoute() when route != null:
return route(_that.path);case IamTriggerEvent() when event != null:
return event(_that.name,_that.params);case _:
  return null;

}
}

}

/// @nodoc


class IamTriggerLaunch implements IamTriggerContext {
  const IamTriggerLaunch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamTriggerLaunch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IamTriggerContext.launch()';
}


}




/// @nodoc


class IamTriggerRoute implements IamTriggerContext {
  const IamTriggerRoute(this.path);
  

 final  String path;

/// Create a copy of IamTriggerContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamTriggerRouteCopyWith<IamTriggerRoute> get copyWith => _$IamTriggerRouteCopyWithImpl<IamTriggerRoute>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamTriggerRoute&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'IamTriggerContext.route(path: $path)';
}


}

/// @nodoc
abstract mixin class $IamTriggerRouteCopyWith<$Res> implements $IamTriggerContextCopyWith<$Res> {
  factory $IamTriggerRouteCopyWith(IamTriggerRoute value, $Res Function(IamTriggerRoute) _then) = _$IamTriggerRouteCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$IamTriggerRouteCopyWithImpl<$Res>
    implements $IamTriggerRouteCopyWith<$Res> {
  _$IamTriggerRouteCopyWithImpl(this._self, this._then);

  final IamTriggerRoute _self;
  final $Res Function(IamTriggerRoute) _then;

/// Create a copy of IamTriggerContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(IamTriggerRoute(
null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class IamTriggerEvent implements IamTriggerContext {
  const IamTriggerEvent(this.name, {final  Map<String, dynamic> params = const <String, dynamic>{}}): _params = params;
  

 final  String name;
 final  Map<String, dynamic> _params;
@JsonKey() Map<String, dynamic> get params {
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_params);
}


/// Create a copy of IamTriggerContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IamTriggerEventCopyWith<IamTriggerEvent> get copyWith => _$IamTriggerEventCopyWithImpl<IamTriggerEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IamTriggerEvent&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._params, _params));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_params));

@override
String toString() {
  return 'IamTriggerContext.event(name: $name, params: $params)';
}


}

/// @nodoc
abstract mixin class $IamTriggerEventCopyWith<$Res> implements $IamTriggerContextCopyWith<$Res> {
  factory $IamTriggerEventCopyWith(IamTriggerEvent value, $Res Function(IamTriggerEvent) _then) = _$IamTriggerEventCopyWithImpl;
@useResult
$Res call({
 String name, Map<String, dynamic> params
});




}
/// @nodoc
class _$IamTriggerEventCopyWithImpl<$Res>
    implements $IamTriggerEventCopyWith<$Res> {
  _$IamTriggerEventCopyWithImpl(this._self, this._then);

  final IamTriggerEvent _self;
  final $Res Function(IamTriggerEvent) _then;

/// Create a copy of IamTriggerContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? params = null,}) {
  return _then(IamTriggerEvent(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,params: null == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
