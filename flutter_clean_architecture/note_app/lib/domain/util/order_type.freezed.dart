// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderType {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderType()';
}


}

/// @nodoc
class $OrderTypeCopyWith<$Res>  {
$OrderTypeCopyWith(OrderType _, $Res Function(OrderType) __);
}


/// Adds pattern-matching-related methods to [OrderType].
extension OrderTypePatterns on OrderType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Ascending value)?  ascending,TResult Function( Descending value)?  descending,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Ascending() when ascending != null:
return ascending(_that);case Descending() when descending != null:
return descending(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Ascending value)  ascending,required TResult Function( Descending value)  descending,}){
final _that = this;
switch (_that) {
case Ascending():
return ascending(_that);case Descending():
return descending(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Ascending value)?  ascending,TResult? Function( Descending value)?  descending,}){
final _that = this;
switch (_that) {
case Ascending() when ascending != null:
return ascending(_that);case Descending() when descending != null:
return descending(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  ascending,TResult Function()?  descending,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Ascending() when ascending != null:
return ascending();case Descending() when descending != null:
return descending();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  ascending,required TResult Function()  descending,}) {final _that = this;
switch (_that) {
case Ascending():
return ascending();case Descending():
return descending();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  ascending,TResult? Function()?  descending,}) {final _that = this;
switch (_that) {
case Ascending() when ascending != null:
return ascending();case Descending() when descending != null:
return descending();case _:
  return null;

}
}

}

/// @nodoc


class Ascending implements OrderType {
   Ascending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ascending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderType.ascending()';
}


}




/// @nodoc


class Descending implements OrderType {
   Descending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Descending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderType.descending()';
}


}




// dart format on
