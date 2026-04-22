import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/data/repository/fake_note_repo.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/domain/use_case/add_note_use_case.dart';
import 'package:note_app/domain/use_case/delete_note_use_case.dart';
import 'package:note_app/domain/use_case/get_note_use_case.dart';

final fakeRepoProvider = Provider<NoteRepository>(
  (ref) => FakeNoteRepository(),
);
final getNotesUseCaseProvider = Provider<GetNotesUseCase>((ref) {
  final repo = ref.watch(fakeRepoProvider);
  return GetNotesUseCase(repo);
});
final deleteNoteUseCaseProvider = Provider<DeleteNoteUseCase>((ref) {
  final repo = ref.watch(fakeRepoProvider);
  return DeleteNoteUseCase(repo);
});
final addNoteUseCaseProvider = Provider<AddNoteUseCase>((ref) {
  final repo = ref.watch(fakeRepoProvider);
  return AddNoteUseCase(repo);
});

//----------------------------------------------------------------------
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
