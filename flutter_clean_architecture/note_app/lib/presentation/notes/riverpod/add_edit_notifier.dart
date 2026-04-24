import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/di/provider_setup.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/presentation/notes/common/validation_exception.dart';
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

    if (title.isEmpty || content.isEmpty) {
      throw ValidationException('제목이나 내용이 비어있습니다.');
    }

    final note = Note(
      id: id,
      title: title,
      content: content,
      color: color,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );

    if (id == null) {
      await addNote(note);
    } else {
      await updateNote(note);
    }
  }
}
