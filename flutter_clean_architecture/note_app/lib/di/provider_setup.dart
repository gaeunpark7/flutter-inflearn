import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/data/repository/fake_note_repo.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/domain/use_case/add_note_use_case.dart';
import 'package:note_app/domain/use_case/delete_note_use_case.dart';
import 'package:note_app/domain/use_case/get_note_use_case.dart';
import 'package:note_app/domain/use_case/update_note_use_case.dart';

final fakeRepoProvider = Provider<NoteRepository>(
  (ref) => FakeNoteRepository(),
);

final getNotesUseCaseProvider = Provider<GetNotesUseCase>((ref) {
  final repo = ref.watch(fakeRepoProvider);
  return GetNotesUseCase(repo);
});

final addNoteUseCaseProvider = Provider<AddNoteUseCase>((ref) {
  final repo = ref.watch(fakeRepoProvider);
  return AddNoteUseCase(repo);
});

final updateNoteUseCaseProvider = Provider<UpdateNoteUseCase>((ref) {
  final repo = ref.watch(fakeRepoProvider);
  return UpdateNoteUseCase(repo);
});

final deleteNoteUseCaseProvider = Provider<DeleteNoteUseCase>((ref) {
  final repo = ref.watch(fakeRepoProvider);
  return DeleteNoteUseCase(repo);
});
