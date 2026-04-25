import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

enum NoteOrder { title, date, color }

enum OrderType { ascending, descending }

class GetNotesUseCase {
  final NoteRepository repository;
  GetNotesUseCase(this.repository);

  Future<List<Note>> call() async {
    final notes = List<Note>.from(await repository.getNote());
    notes.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return notes;
  }
}
