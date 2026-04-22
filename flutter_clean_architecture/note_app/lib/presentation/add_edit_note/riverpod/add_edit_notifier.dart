import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/data/repository/fake_note_repo.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/domain/use_case/add_note_use_case.dart';
import 'package:note_app/domain/use_case/update_note_use_case.dart';

final repoProvider = Provider<NoteRepository>((ref) => FakeNoteRepository());

final addNoteUseCaseProvider = Provider<AddNoteUseCase>((ref) {
  final repo = ref.watch(repoProvider);
  return AddNoteUseCase(repo);
});

final updateNoteUseCaseProvider = Provider<UpdateNoteUseCase>((ref) {
  final repo = ref.watch(repoProvider);
  return UpdateNoteUseCase(repo);
});

final addEditNotifierProvider = AsyncNotifierProvider<AddEditNotifier, void>(
  AddEditNotifier.new,
);

class AddEditNotifier extends AsyncNotifier<void> {
  int _color = Colors.orange.value;
  int get color => _color;

  @override
  Future<void> build() async {}

  Future<void> changeColor(int color) async {
    _color = color;
    state = const AsyncData(null);
  }

  Future<void> saveNote(int? id, String title, String content) async {
    state = const AsyncLoading();

    final addNote = ref.read(addNoteUseCaseProvider);
    final updateNote = ref.read(updateNoteUseCaseProvider);

    final note = Note(
      id: id,
      title: title,
      content: content,
      color: _color,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );

    state = await AsyncValue.guard(() async {
      if (id == null) {
        await addNote(note);
      } else {
        await updateNote(note);
      }
    });
  }
}
