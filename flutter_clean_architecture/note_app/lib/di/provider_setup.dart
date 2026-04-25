import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/data/repository/fake_note_repo.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/domain/use_case/add_note_use_case.dart';
import 'package:note_app/domain/use_case/delete_note_use_case.dart';
import 'package:note_app/domain/use_case/get_note_use_case.dart';
import 'package:note_app/domain/use_case/note_use_cases.dart';
import 'package:note_app/domain/use_case/save_note_use_case.dart';
import 'package:note_app/domain/use_case/update_note_use_case.dart';

final fakeRepoProvider = Provider<NoteRepository>(
  (ref) => FakeNoteRepository(),
);

final noteUseCasesProvider = Provider<NoteUseCases>((ref) {
  final repo = ref.watch(fakeRepoProvider);
  final addNote = AddNoteUseCase(repo);
  final updateNote = UpdateNoteUseCase(repo);
  return NoteUseCases(
    getNotes: GetNotesUseCase(repo),
    addNote: addNote,
    updateNote: updateNote,
    deleteNote: DeleteNoteUseCase(repo),
    saveNote: SaveNoteUseCase(addNote: addNote, updateNote: updateNote),
  );
});

final getNotesUseCaseProvider = Provider<GetNotesUseCase>((ref) {
  return ref.watch(noteUseCasesProvider).getNotes;
});

final addNoteUseCaseProvider = Provider<AddNoteUseCase>((ref) {
  return ref.watch(noteUseCasesProvider).addNote;
});

final updateNoteUseCaseProvider = Provider<UpdateNoteUseCase>((ref) {
  return ref.watch(noteUseCasesProvider).updateNote;
});

final deleteNoteUseCaseProvider = Provider<DeleteNoteUseCase>((ref) {
  return ref.watch(noteUseCasesProvider).deleteNote;
});
