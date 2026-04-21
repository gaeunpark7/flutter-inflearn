import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class GetNoteByIdUseCase {
  final NoteRepository repository;

  GetNoteByIdUseCase(this.repository);

  Future<Note?> call(int id) async {
    final note = await repository.getNoteById(id);
    return note;
  }
}
