import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/use_case/add_note_use_case.dart';
import 'package:note_app/domain/use_case/update_note_use_case.dart';

class SaveNoteUseCase {
  final AddNoteUseCase addNote;
  final UpdateNoteUseCase updateNote;

  SaveNoteUseCase({required this.addNote, required this.updateNote});

  Future<void> call(Note note) async {
    if (note.id == null) {
      await addNote(note);
    } else {
      await updateNote(note);
    }
  }
}
