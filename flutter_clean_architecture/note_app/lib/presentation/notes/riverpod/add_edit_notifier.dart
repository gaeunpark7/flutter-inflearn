import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/di/provider_setup.dart';
import 'package:note_app/domain/model/note.dart';

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
