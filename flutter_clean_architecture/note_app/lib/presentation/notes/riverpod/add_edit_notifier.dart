import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/di/provider_setup.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/presentation/notes/riverpod/selected_color_notifier.dart';

final addEditNotifierProvider = AsyncNotifierProvider<AddEditNotifier, void>(
  AddEditNotifier.new,
);

class AddEditNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> saveNote(int? id, String title, String content) async {
    state = const AsyncLoading();

    final addNote = ref.read(addNoteUseCaseProvider);
    final updateNote = ref.read(updateNoteUseCaseProvider);
    final color = ref.read(selectedColorProvider);

    final note = Note(
      id: id,
      title: title,
      content: content,
      color: color,
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
