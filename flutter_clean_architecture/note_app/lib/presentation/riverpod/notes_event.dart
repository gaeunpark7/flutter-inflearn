import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/domain/model/note.dart';
part 'notes_event.freezed.dart';

@freezed
sealed class NotesEvent with _$NotesEvent {
  factory NotesEvent.loadNotes() = LoadNotes;
  factory NotesEvent.deleteNote(Note note) = DeleteNote;
  factory NotesEvent.restoreNote() = RestoreNote;
}
