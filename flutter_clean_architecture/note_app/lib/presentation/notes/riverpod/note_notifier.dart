import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/di/provider_setup.dart';
import 'package:note_app/domain/model/note.dart';

final noteNotifierProvider = AsyncNotifierProvider<NoteNotifier, List<Note>>(
  NoteNotifier.new,
);

class NoteNotifier extends AsyncNotifier<List<Note>> {
  Note? _lastDeletedNote;

  @override
  Future<List<Note>> build() async {
    final getNotes = ref.watch(getNotesUseCaseProvider);
    final notes = await getNotes();
    return UnmodifiableListView(List<Note>.from(notes));
    // return <Note>[];
  }

  Future<void> loadNotes() async {
    state = const AsyncLoading();
    final getNotes = ref.read(getNotesUseCaseProvider);

    state = await AsyncValue.guard(() async {
      final notes = await getNotes();
      return UnmodifiableListView(List<Note>.from(notes)); //새 리스트로 만들어 UI 갱신
    });
  }

  Future<void> deleteNote(Note note) async {
    _lastDeletedNote = note;

    state = const AsyncLoading();
    final delete = ref.read(deleteNoteUseCaseProvider);
    final getNotes = ref.read(getNotesUseCaseProvider);

    state = await AsyncValue.guard(() async {
      await delete(note);
      final notes = await getNotes();
      return UnmodifiableListView(List<Note>.from(notes));
    });
  }

  Future<void> restoreNote() async {
    final noteToRestore = _lastDeletedNote;
    if (noteToRestore == null) return;

    state = const AsyncLoading();
    final addNote = ref.read(addNoteUseCaseProvider);
    final getNotes = ref.read(getNotesUseCaseProvider);

    state = await AsyncValue.guard(() async {
      await addNote(noteToRestore);
      _lastDeletedNote = null;
      final notes = await getNotes();
      return UnmodifiableListView(List<Note>.from(notes));
    });
  }
}
