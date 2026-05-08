// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'in_app_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InAppMessage {

 String get id; bool get enabled; IamLayout get layout; DateTime? get startAt; DateTime? get endAt; IamTrigger get trigger; IamTargeting get targeting; IamFrequency get frequency; List<IamVariant> get variants; bool get showCloseButton;
/// Create a copy of InAppMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InAppMessageCopyWith<InAppMessage> get copyWith => _$InAppMessageCopyWithImpl<InAppMessage>(this as InAppMessage, _$identity);

  /// Serializes this InAppMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InAppMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.layout, layout) || other.layout == layout)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.trigger, trigger) || other.trigger == trigger)&&(identical(other.targeting, targeting) || other.targeting == targeting)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&const DeepCollectionEquality().equals(other.variants, variants)&&(identical(other.showCloseButton, showCloseButton) || other.showCloseButton == showCloseButton));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,enabled,layout,startAt,endAt,trigger,targeting,frequency,const DeepCollectionEquality().hash(variants),showCloseButton);

@override
String toString() {
  return 'InAppMessage(id: $id, enabled: $enabled, layout: $layout, startAt: $startAt, endAt: $endAt, trigger: $trigger, targeting: $targeting, frequency: $frequency, variants: $variants, showCloseButton: $showCloseButton)';
}


}

/// @nodoc
abstract mixin class $InAppMessageCopyWith<$Res>  {
  factory $InAppMessageCopyWith(InAppMessage value, $Res Function(InAppMessage) _then) = _$InAppMessageCopyWithImpl;
@useResult
$Res call({
 String id, bool enabled, IamLayout layout, DateTime? startAt, DateTime? endAt, IamTrigger trigger, IamTargeting targeting, IamFrequency frequency, List<IamVariant> variants, bool showCloseButton
});


$IamTriggerCopyWith<$Res> get trigger;$IamTargetingCopyWith<$Res> get targeting;$IamFrequencyCopyWith<$Res> get frequency;

}
/// @nodoc
class _$InAppMessageCopyWithImpl<$Res>
    implements $InAppMessageCopyWith<$Res> {
  _$InAppMessageCopyWithImpl(this._self, this._then);

  final InAppMessage _self;
  final $Res Function(InAppMessage) _then;

/// Create a copy of InAppMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? enabled = null,Object? layout = null,Object? startAt = freezed,Object? endAt = freezed,Object? trigger = null,Object? targeting = null,Object? frequency = null,Object? variants = null,Object? showCloseButton = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,layout: null == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as IamLayout,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime?,trigger: null == trigger ? _self.trigger : trigger // ignore: cast_nullable_to_non_nullable
as IamTrigger,targeting: null == targeting ? _self.targeting : targeting // ignore: cast_nullable_to_non_nullable
as IamTargeting,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as IamFrequency,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<IamVariant>,showCloseButton: null == showCloseButton ? _self.showCloseButton : showCloseButton // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of InAppMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamTriggerCopyWith<$Res> get trigger {
  
  return $IamTriggerCopyWith<$Res>(_self.trigger, (value) {
    return _then(_self.copyWith(trigger: value));
  });
}/// Create a copy of InAppMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamTargetingCopyWith<$Res> get targeting {
  
  return $IamTargetingCopyWith<$Res>(_self.targeting, (value) {
    return _then(_self.copyWith(targeting: value));
  });
}/// Create a copy of InAppMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamFrequencyCopyWith<$Res> get frequency {
  
  return $IamFrequencyCopyWith<$Res>(_self.frequency, (value) {
    return _then(_self.copyWith(frequency: value));
  });
}
}


/// Adds pattern-matching-related methods to [InAppMessage].
extension InAppMessagePatterns on InAppMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InAppMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InAppMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InAppMessage value)  $default,){
final _that = this;
switch (_that) {
case _InAppMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InAppMessage value)?  $default,){
final _that = this;
switch (_that) {
case _InAppMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool enabled,  IamLayout layout,  DateTime? startAt,  DateTime? endAt,  IamTrigger trigger,  IamTargeting targeting,  IamFrequency frequency,  List<IamVariant> variants,  bool showCloseButton)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InAppMessage() when $default != null:
return $default(_that.id,_that.enabled,_that.layout,_that.startAt,_that.endAt,_that.trigger,_that.targeting,_that.frequency,_that.variants,_that.showCloseButton);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool enabled,  IamLayout layout,  DateTime? startAt,  DateTime? endAt,  IamTrigger trigger,  IamTargeting targeting,  IamFrequency frequency,  List<IamVariant> variants,  bool showCloseButton)  $default,) {final _that = this;
switch (_that) {
case _InAppMessage():
return $default(_that.id,_that.enabled,_that.layout,_that.startAt,_that.endAt,_that.trigger,_that.targeting,_that.frequency,_that.variants,_that.showCloseButton);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool enabled,  IamLayout layout,  DateTime? startAt,  DateTime? endAt,  IamTrigger trigger,  IamTargeting targeting,  IamFrequency frequency,  List<IamVariant> variants,  bool showCloseButton)?  $default,) {final _that = this;
switch (_that) {
case _InAppMessage() when $default != null:
return $default(_that.id,_that.enabled,_that.layout,_that.startAt,_that.endAt,_that.trigger,_that.targeting,_that.frequency,_that.variants,_that.showCloseButton);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InAppMessage implements InAppMessage {
  const _InAppMessage({required this.id, this.enabled = true, this.layout = IamLayout.modal, this.startAt, this.endAt, this.trigger = const IamTrigger(), this.targeting = const IamTargeting(), this.frequency = const IamFrequency(), final  List<IamVariant> variants = const <IamVariant>[], this.showCloseButton = true}): _variants = variants;
  factory _InAppMessage.fromJson(Map<String, dynamic> json) => _$InAppMessageFromJson(json);

@override final  String id;
@override@JsonKey() final  bool enabled;
@override@JsonKey() final  IamLayout layout;
@override final  DateTime? startAt;
@override final  DateTime? endAt;
@override@JsonKey() final  IamTrigger trigger;
@override@JsonKey() final  IamTargeting targeting;
@override@JsonKey() final  IamFrequency frequency;
 final  List<IamVariant> _variants;
@override@JsonKey() List<IamVariant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}

@override@JsonKey() final  bool showCloseButton;

/// Create a copy of InAppMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InAppMessageCopyWith<_InAppMessage> get copyWith => __$InAppMessageCopyWithImpl<_InAppMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InAppMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InAppMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.layout, layout) || other.layout == layout)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.trigger, trigger) || other.trigger == trigger)&&(identical(other.targeting, targeting) || other.targeting == targeting)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&const DeepCollectionEquality().equals(other._variants, _variants)&&(identical(other.showCloseButton, showCloseButton) || other.showCloseButton == showCloseButton));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,enabled,layout,startAt,endAt,trigger,targeting,frequency,const DeepCollectionEquality().hash(_variants),showCloseButton);

@override
String toString() {
  return 'InAppMessage(id: $id, enabled: $enabled, layout: $layout, startAt: $startAt, endAt: $endAt, trigger: $trigger, targeting: $targeting, frequency: $frequency, variants: $variants, showCloseButton: $showCloseButton)';
}


}

/// @nodoc
abstract mixin class _$InAppMessageCopyWith<$Res> implements $InAppMessageCopyWith<$Res> {
  factory _$InAppMessageCopyWith(_InAppMessage value, $Res Function(_InAppMessage) _then) = __$InAppMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, bool enabled, IamLayout layout, DateTime? startAt, DateTime? endAt, IamTrigger trigger, IamTargeting targeting, IamFrequency frequency, List<IamVariant> variants, bool showCloseButton
});


@override $IamTriggerCopyWith<$Res> get trigger;@override $IamTargetingCopyWith<$Res> get targeting;@override $IamFrequencyCopyWith<$Res> get frequency;

}
/// @nodoc
class __$InAppMessageCopyWithImpl<$Res>
    implements _$InAppMessageCopyWith<$Res> {
  __$InAppMessageCopyWithImpl(this._self, this._then);

  final _InAppMessage _self;
  final $Res Function(_InAppMessage) _then;

/// Create a copy of InAppMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? enabled = null,Object? layout = null,Object? startAt = freezed,Object? endAt = freezed,Object? trigger = null,Object? targeting = null,Object? frequency = null,Object? variants = null,Object? showCloseButton = null,}) {
  return _then(_InAppMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,layout: null == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as IamLayout,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endAt: freezed == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as DateTime?,trigger: null == trigger ? _self.trigger : trigger // ignore: cast_nullable_to_non_nullable
as IamTrigger,targeting: null == targeting ? _self.targeting : targeting // ignore: cast_nullable_to_non_nullable
as IamTargeting,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as IamFrequency,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<IamVariant>,showCloseButton: null == showCloseButton ? _self.showCloseButton : showCloseButton // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of InAppMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamTriggerCopyWith<$Res> get trigger {
  
  return $IamTriggerCopyWith<$Res>(_self.trigger, (value) {
    return _then(_self.copyWith(trigger: value));
  });
}/// Create a copy of InAppMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamTargetingCopyWith<$Res> get targeting {
  
  return $IamTargetingCopyWith<$Res>(_self.targeting, (value) {
    return _then(_self.copyWith(targeting: value));
  });
}/// Create a copy of InAppMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IamFrequencyCopyWith<$Res> get frequency {
  
  return $IamFrequencyCopyWith<$Res>(_self.frequency, (value) {
    return _then(_self.copyWith(frequency: value));
  });
}
}

// dart format on
