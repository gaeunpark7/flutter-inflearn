import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class FakeNoteRepository implements NoteRepository {
  final _notes = <Note>[
    Note(title: 't', content: 'c', color: 1, timestamp: 1, id: 1),
  ];

  int _nextId() {
    if (_notes.isEmpty) return 1;
    final maxId = _notes
        .where((e) => e.id != null)
        .map((e) => e.id!)
        .fold<int>(0, (a, b) => a > b ? a : b);
    return maxId + 1;
  }

  @override
  Future<List<Note>> getNote() async => _notes;

  @override
  Future<Note?> getNoteById(int id) async {
    final index = _notes.indexWhere((e) => e.id == id);
    if (index == -1) return null;
    return _notes[index];
  }

  @override
  Future<void> insertNote(Note note) async {
    final noteWithId = note.id == null ? note.copyWith(id: _nextId()) : note;
    _notes.add(noteWithId);
  }

  @override
  Future<void> updateNote(Note note) async {
    final id = note.id;
    if (id == null) return;

    final index = _notes.indexWhere((e) => e.id == id);
    if (index == -1) return;
    _notes[index] = note;
  }

  @override
  Future<void> deleteNote(Note note) async =>
      _notes.removeWhere((e) => e.id == note.id);
}
