import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/di/provider_setup.dart';
import 'package:note_app/domain/model/note.dart';

final noteNotifierProvider = AsyncNotifierProvider<NoteNotifier, List<Note>>(
  NoteNotifier.new,
);

class NoteNotifier extends AsyncNotifier<List<Note>> {
  Note? _lastDeletedNote;

  Future<UnmodifiableListView<Note>> _fetchNotes() async {
    final useCases = ref.read(noteUseCasesProvider);
    final notes = await useCases.getNotes();
    return UnmodifiableListView(List<Note>.from(notes));
  }

  @override
  Future<List<Note>> build() async {
    ref.watch(noteUseCasesProvider);
    return _fetchNotes();
    // return <Note>[];
  }

  Future<void> loadNotes() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _fetchNotes(); //새 리스트로 만들어 UI 갱신
    });
  }

  Future<void> deleteNote(Note note) async {
    _lastDeletedNote = note;

    state = const AsyncLoading();
    final useCases = ref.read(noteUseCasesProvider);

    state = await AsyncValue.guard(() async {
      await useCases.deleteNote(note);
      return _fetchNotes();
    });
  }

  Future<void> restoreNote() async {
    final noteToRestore = _lastDeletedNote;
    if (noteToRestore == null) return;

    state = const AsyncLoading();
    final useCases = ref.read(noteUseCasesProvider);

    state = await AsyncValue.guard(() async {
      await useCases.addNote(noteToRestore);
      _lastDeletedNote = null;
      return _fetchNotes();
    });
  }
}
