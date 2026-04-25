import 'package:note_app/domain/use_case/add_note_use_case.dart';
import 'package:note_app/domain/use_case/delete_note_use_case.dart';
import 'package:note_app/domain/use_case/get_note_use_case.dart';
import 'package:note_app/domain/use_case/save_note_use_case.dart';
import 'package:note_app/domain/use_case/update_note_use_case.dart';

class NoteUseCases {
  final GetNotesUseCase getNotes;
  final AddNoteUseCase addNote;
  final UpdateNoteUseCase updateNote;
  final DeleteNoteUseCase deleteNote;
  final SaveNoteUseCase saveNote;

  NoteUseCases({
    required this.getNotes,
    required this.addNote,
    required this.updateNote,
    required this.deleteNote,
    required this.saveNote,
  });
}
