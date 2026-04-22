import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class FakeNoteRepository implements NoteRepository {
  final _notes = <Note>[
    Note(title: 't', content: 'c', color: 1, timestamp: 1, id: 1),
  ];

  @override
  Future<List<Note>> getNote() async => _notes;

  @override
  Future<Note?> getNoteById(int id) async =>
      _notes.where((e) => e.id == id).cast<Note?>().first;

  @override
  Future<void> insertNote(Note note) async => _notes.add(note);

  @override
  Future<void> updateNote(Note note) async => throw UnimplementedError();
  @override
  Future<void> deleteNote(Note note) async =>
      _notes.removeWhere((e) => e.id == note.id);
}
