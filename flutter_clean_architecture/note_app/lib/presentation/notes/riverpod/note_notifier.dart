import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:note_app/di/provider_setup.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/order_type.dart';

final noteNotifierProvider = AsyncNotifierProvider<NoteNotifier, List<Note>>(
  NoteNotifier.new,
);
// 정렬
final noteOrderProvider = StateProvider<NoteOrder>((ref) {
  return NoteOrder.date(OrderType.descending());
});

class NoteNotifier extends AsyncNotifier<List<Note>> {
  NoteOrder _readOrder() => ref.read(noteOrderProvider);
  Note? _lastDeletedNote;
  Future<UnmodifiableListView<Note>> _fetchNotes(NoteOrder order) async {
    final useCases = ref.read(noteUseCasesProvider);
    final notes = await useCases.getNotes(order);
    return UnmodifiableListView(List<Note>.from(notes));
  }

  @override
  Future<List<Note>> build() async {
    final order = ref.watch(noteOrderProvider); // order가 바뀌면 build 재실행
    ref.watch(noteUseCasesProvider);
    return _fetchNotes(order);
  }

  // Future<void> loadNotes() async {
  //   state = const AsyncLoading();
  //   final order = _readOrder();

  //   state = await AsyncValue.guard(() async {
  //     return _fetchNotes(order); //새 리스트로 만들어 UI 갱신
  //   });
  // }

  Future<void> deleteNote(Note note) async {
    _lastDeletedNote = note;

    state = const AsyncLoading();
    final useCases = ref.read(noteUseCasesProvider);
    final order = _readOrder();

    state = await AsyncValue.guard(() async {
      await useCases.deleteNote(note);
      return _fetchNotes(order);
    });
  }

  Future<void> restoreNote() async {
    final noteToRestore = _lastDeletedNote;
    if (noteToRestore == null) return;

    state = const AsyncLoading();
    final useCases = ref.read(noteUseCasesProvider);
    final order = _readOrder();

    state = await AsyncValue.guard(() async {
      await useCases.addNote(noteToRestore);
      _lastDeletedNote = null;
      return _fetchNotes(order);
    });
  }

  Future<void> changeOrder(NoteOrder noteOrder) async {
    ref.read(noteOrderProvider.notifier).state = noteOrder;
  }
}
