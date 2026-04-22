// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotesEvent()';
}


}

/// @nodoc
class $NotesEventCopyWith<$Res>  {
$NotesEventCopyWith(NotesEvent _, $Res Function(NotesEvent) __);
}


/// Adds pattern-matching-related methods to [NotesEvent].
extension NotesEventPatterns on NotesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadNotes value)?  loadNotes,TResult Function( DeleteNote value)?  deleteNote,TResult Function( RestoreNote value)?  restoreNote,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadNotes() when loadNotes != null:
return loadNotes(_that);case DeleteNote() when deleteNote != null:
return deleteNote(_that);case RestoreNote() when restoreNote != null:
return restoreNote(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadNotes value)  loadNotes,required TResult Function( DeleteNote value)  deleteNote,required TResult Function( RestoreNote value)  restoreNote,}){
final _that = this;
switch (_that) {
case LoadNotes():
return loadNotes(_that);case DeleteNote():
return deleteNote(_that);case RestoreNote():
return restoreNote(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadNotes value)?  loadNotes,TResult? Function( DeleteNote value)?  deleteNote,TResult? Function( RestoreNote value)?  restoreNote,}){
final _that = this;
switch (_that) {
case LoadNotes() when loadNotes != null:
return loadNotes(_that);case DeleteNote() when deleteNote != null:
return deleteNote(_that);case RestoreNote() when restoreNote != null:
return restoreNote(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadNotes,TResult Function( Note note)?  deleteNote,TResult Function()?  restoreNote,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadNotes() when loadNotes != null:
return loadNotes();case DeleteNote() when deleteNote != null:
return deleteNote(_that.note);case RestoreNote() when restoreNote != null:
return restoreNote();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadNotes,required TResult Function( Note note)  deleteNote,required TResult Function()  restoreNote,}) {final _that = this;
switch (_that) {
case LoadNotes():
return loadNotes();case DeleteNote():
return deleteNote(_that.note);case RestoreNote():
return restoreNote();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadNotes,TResult? Function( Note note)?  deleteNote,TResult? Function()?  restoreNote,}) {final _that = this;
switch (_that) {
case LoadNotes() when loadNotes != null:
return loadNotes();case DeleteNote() when deleteNote != null:
return deleteNote(_that.note);case RestoreNote() when restoreNote != null:
return restoreNote();case _:
  return null;

}
}

}

/// @nodoc


class LoadNotes implements NotesEvent {
   LoadNotes();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadNotes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotesEvent.loadNotes()';
}


}




/// @nodoc


class DeleteNote implements NotesEvent {
   DeleteNote(this.note);
  

 final  Note note;

/// Create a copy of NotesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteNoteCopyWith<DeleteNote> get copyWith => _$DeleteNoteCopyWithImpl<DeleteNote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteNote&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'NotesEvent.deleteNote(note: $note)';
}


}

/// @nodoc
abstract mixin class $DeleteNoteCopyWith<$Res> implements $NotesEventCopyWith<$Res> {
  factory $DeleteNoteCopyWith(DeleteNote value, $Res Function(DeleteNote) _then) = _$DeleteNoteCopyWithImpl;
@useResult
$Res call({
 Note note
});


$NoteCopyWith<$Res> get note;

}
/// @nodoc
class _$DeleteNoteCopyWithImpl<$Res>
    implements $DeleteNoteCopyWith<$Res> {
  _$DeleteNoteCopyWithImpl(this._self, this._then);

  final DeleteNote _self;
  final $Res Function(DeleteNote) _then;

/// Create a copy of NotesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(DeleteNote(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as Note,
  ));
}

/// Create a copy of NotesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteCopyWith<$Res> get note {
  
  return $NoteCopyWith<$Res>(_self.note, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}

/// @nodoc


class RestoreNote implements NotesEvent {
   RestoreNote();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestoreNote);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotesEvent.restoreNote()';
}


}




// dart format on
