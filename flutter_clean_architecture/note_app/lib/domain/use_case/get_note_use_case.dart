import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class GetNotesUseCase {
  final NoteRepository repository;
  GetNotesUseCase(this.repository);
  Future<List<Note>> call() async {
    List<Note> notes = await repository.getNote();
    return notes;
  }
}
