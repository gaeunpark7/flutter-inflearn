// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteOrder {

 OrderType get orderType;
/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteOrderCopyWith<NoteOrder> get copyWith => _$NoteOrderCopyWithImpl<NoteOrder>(this as NoteOrder, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteOrder&&(identical(other.orderType, orderType) || other.orderType == orderType));
}


@override
int get hashCode => Object.hash(runtimeType,orderType);

@override
String toString() {
  return 'NoteOrder(orderType: $orderType)';
}


}

/// @nodoc
abstract mixin class $NoteOrderCopyWith<$Res>  {
  factory $NoteOrderCopyWith(NoteOrder value, $Res Function(NoteOrder) _then) = _$NoteOrderCopyWithImpl;
@useResult
$Res call({
 OrderType orderType
});


$OrderTypeCopyWith<$Res> get orderType;

}
/// @nodoc
class _$NoteOrderCopyWithImpl<$Res>
    implements $NoteOrderCopyWith<$Res> {
  _$NoteOrderCopyWithImpl(this._self, this._then);

  final NoteOrder _self;
  final $Res Function(NoteOrder) _then;

/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderType = null,}) {
  return _then(_self.copyWith(
orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as OrderType,
  ));
}
/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTypeCopyWith<$Res> get orderType {
  
  return $OrderTypeCopyWith<$Res>(_self.orderType, (value) {
    return _then(_self.copyWith(orderType: value));
  });
}
}


/// Adds pattern-matching-related methods to [NoteOrder].
extension NoteOrderPatterns on NoteOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoteOrderTitle value)?  title,TResult Function( NoteOrderDate value)?  date,TResult Function( NoteOrderColor value)?  color,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoteOrderTitle() when title != null:
return title(_that);case NoteOrderDate() when date != null:
return date(_that);case NoteOrderColor() when color != null:
return color(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoteOrderTitle value)  title,required TResult Function( NoteOrderDate value)  date,required TResult Function( NoteOrderColor value)  color,}){
final _that = this;
switch (_that) {
case NoteOrderTitle():
return title(_that);case NoteOrderDate():
return date(_that);case NoteOrderColor():
return color(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoteOrderTitle value)?  title,TResult? Function( NoteOrderDate value)?  date,TResult? Function( NoteOrderColor value)?  color,}){
final _that = this;
switch (_that) {
case NoteOrderTitle() when title != null:
return title(_that);case NoteOrderDate() when date != null:
return date(_that);case NoteOrderColor() when color != null:
return color(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( OrderType orderType)?  title,TResult Function( OrderType orderType)?  date,TResult Function( OrderType orderType)?  color,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoteOrderTitle() when title != null:
return title(_that.orderType);case NoteOrderDate() when date != null:
return date(_that.orderType);case NoteOrderColor() when color != null:
return color(_that.orderType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( OrderType orderType)  title,required TResult Function( OrderType orderType)  date,required TResult Function( OrderType orderType)  color,}) {final _that = this;
switch (_that) {
case NoteOrderTitle():
return title(_that.orderType);case NoteOrderDate():
return date(_that.orderType);case NoteOrderColor():
return color(_that.orderType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( OrderType orderType)?  title,TResult? Function( OrderType orderType)?  date,TResult? Function( OrderType orderType)?  color,}) {final _that = this;
switch (_that) {
case NoteOrderTitle() when title != null:
return title(_that.orderType);case NoteOrderDate() when date != null:
return date(_that.orderType);case NoteOrderColor() when color != null:
return color(_that.orderType);case _:
  return null;

}
}

}

/// @nodoc


class NoteOrderTitle implements NoteOrder {
   NoteOrderTitle(this.orderType);
  

@override final  OrderType orderType;

/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteOrderTitleCopyWith<NoteOrderTitle> get copyWith => _$NoteOrderTitleCopyWithImpl<NoteOrderTitle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteOrderTitle&&(identical(other.orderType, orderType) || other.orderType == orderType));
}


@override
int get hashCode => Object.hash(runtimeType,orderType);

@override
String toString() {
  return 'NoteOrder.title(orderType: $orderType)';
}


}

/// @nodoc
abstract mixin class $NoteOrderTitleCopyWith<$Res> implements $NoteOrderCopyWith<$Res> {
  factory $NoteOrderTitleCopyWith(NoteOrderTitle value, $Res Function(NoteOrderTitle) _then) = _$NoteOrderTitleCopyWithImpl;
@override @useResult
$Res call({
 OrderType orderType
});


@override $OrderTypeCopyWith<$Res> get orderType;

}
/// @nodoc
class _$NoteOrderTitleCopyWithImpl<$Res>
    implements $NoteOrderTitleCopyWith<$Res> {
  _$NoteOrderTitleCopyWithImpl(this._self, this._then);

  final NoteOrderTitle _self;
  final $Res Function(NoteOrderTitle) _then;

/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderType = null,}) {
  return _then(NoteOrderTitle(
null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as OrderType,
  ));
}

/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTypeCopyWith<$Res> get orderType {
  
  return $OrderTypeCopyWith<$Res>(_self.orderType, (value) {
    return _then(_self.copyWith(orderType: value));
  });
}
}

/// @nodoc


class NoteOrderDate implements NoteOrder {
   NoteOrderDate(this.orderType);
  

@override final  OrderType orderType;

/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteOrderDateCopyWith<NoteOrderDate> get copyWith => _$NoteOrderDateCopyWithImpl<NoteOrderDate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteOrderDate&&(identical(other.orderType, orderType) || other.orderType == orderType));
}


@override
int get hashCode => Object.hash(runtimeType,orderType);

@override
String toString() {
  return 'NoteOrder.date(orderType: $orderType)';
}


}

/// @nodoc
abstract mixin class $NoteOrderDateCopyWith<$Res> implements $NoteOrderCopyWith<$Res> {
  factory $NoteOrderDateCopyWith(NoteOrderDate value, $Res Function(NoteOrderDate) _then) = _$NoteOrderDateCopyWithImpl;
@override @useResult
$Res call({
 OrderType orderType
});


@override $OrderTypeCopyWith<$Res> get orderType;

}
/// @nodoc
class _$NoteOrderDateCopyWithImpl<$Res>
    implements $NoteOrderDateCopyWith<$Res> {
  _$NoteOrderDateCopyWithImpl(this._self, this._then);

  final NoteOrderDate _self;
  final $Res Function(NoteOrderDate) _then;

/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderType = null,}) {
  return _then(NoteOrderDate(
null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as OrderType,
  ));
}

/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTypeCopyWith<$Res> get orderType {
  
  return $OrderTypeCopyWith<$Res>(_self.orderType, (value) {
    return _then(_self.copyWith(orderType: value));
  });
}
}

/// @nodoc


class NoteOrderColor implements NoteOrder {
   NoteOrderColor(this.orderType);
  

@override final  OrderType orderType;

/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteOrderColorCopyWith<NoteOrderColor> get copyWith => _$NoteOrderColorCopyWithImpl<NoteOrderColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteOrderColor&&(identical(other.orderType, orderType) || other.orderType == orderType));
}


@override
int get hashCode => Object.hash(runtimeType,orderType);

@override
String toString() {
  return 'NoteOrder.color(orderType: $orderType)';
}


}

/// @nodoc
abstract mixin class $NoteOrderColorCopyWith<$Res> implements $NoteOrderCopyWith<$Res> {
  factory $NoteOrderColorCopyWith(NoteOrderColor value, $Res Function(NoteOrderColor) _then) = _$NoteOrderColorCopyWithImpl;
@override @useResult
$Res call({
 OrderType orderType
});


@override $OrderTypeCopyWith<$Res> get orderType;

}
/// @nodoc
class _$NoteOrderColorCopyWithImpl<$Res>
    implements $NoteOrderColorCopyWith<$Res> {
  _$NoteOrderColorCopyWithImpl(this._self, this._then);

  final NoteOrderColor _self;
  final $Res Function(NoteOrderColor) _then;

/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderType = null,}) {
  return _then(NoteOrderColor(
null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as OrderType,
  ));
}

/// Create a copy of NoteOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTypeCopyWith<$Res> get orderType {
  
  return $OrderTypeCopyWith<$Res>(_self.orderType, (value) {
    return _then(_self.copyWith(orderType: value));
  });
}
}

// dart format on
