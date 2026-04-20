// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_ui_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeUiEvent<T> {

 String get message;
/// Create a copy of HomeUiEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeUiEventCopyWith<T, HomeUiEvent<T>> get copyWith => _$HomeUiEventCopyWithImpl<T, HomeUiEvent<T>>(this as HomeUiEvent<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeUiEvent<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeUiEvent<$T>(message: $message)';
}


}

/// @nodoc
abstract mixin class $HomeUiEventCopyWith<T,$Res>  {
  factory $HomeUiEventCopyWith(HomeUiEvent<T> value, $Res Function(HomeUiEvent<T>) _then) = _$HomeUiEventCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$HomeUiEventCopyWithImpl<T,$Res>
    implements $HomeUiEventCopyWith<T, $Res> {
  _$HomeUiEventCopyWithImpl(this._self, this._then);

  final HomeUiEvent<T> _self;
  final $Res Function(HomeUiEvent<T>) _then;

/// Create a copy of HomeUiEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeUiEvent].
extension HomeUiEventPatterns<T> on HomeUiEvent<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShowSnackBar<T> value)?  showSnackBar,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShowSnackBar() when showSnackBar != null:
return showSnackBar(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShowSnackBar<T> value)  showSnackBar,}){
final _that = this;
switch (_that) {
case ShowSnackBar():
return showSnackBar(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShowSnackBar<T> value)?  showSnackBar,}){
final _that = this;
switch (_that) {
case ShowSnackBar() when showSnackBar != null:
return showSnackBar(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  showSnackBar,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShowSnackBar() when showSnackBar != null:
return showSnackBar(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  showSnackBar,}) {final _that = this;
switch (_that) {
case ShowSnackBar():
return showSnackBar(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  showSnackBar,}) {final _that = this;
switch (_that) {
case ShowSnackBar() when showSnackBar != null:
return showSnackBar(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ShowSnackBar<T> implements HomeUiEvent<T> {
   ShowSnackBar(this.message);
  

@override final  String message;

/// Create a copy of HomeUiEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowSnackBarCopyWith<T, ShowSnackBar<T>> get copyWith => _$ShowSnackBarCopyWithImpl<T, ShowSnackBar<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowSnackBar<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeUiEvent<$T>.showSnackBar(message: $message)';
}


}

/// @nodoc
abstract mixin class $ShowSnackBarCopyWith<T,$Res> implements $HomeUiEventCopyWith<T, $Res> {
  factory $ShowSnackBarCopyWith(ShowSnackBar<T> value, $Res Function(ShowSnackBar<T>) _then) = _$ShowSnackBarCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ShowSnackBarCopyWithImpl<T,$Res>
    implements $ShowSnackBarCopyWith<T, $Res> {
  _$ShowSnackBarCopyWithImpl(this._self, this._then);

  final ShowSnackBar<T> _self;
  final $Res Function(ShowSnackBar<T>) _then;

/// Create a copy of HomeUiEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ShowSnackBar<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
