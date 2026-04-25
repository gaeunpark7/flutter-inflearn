import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/order_type.dart';

class GetNotesUseCase {
  final NoteRepository repository;
  GetNotesUseCase(this.repository);

  Future<List<Note>> call(NoteOrder noteOrder) async {
    final notes = List<Note>.from(await repository.getNote());

    noteOrder.when(
      title: (orderType) {
        orderType.when(
          ascending: () {
            notes.sort((a, b) => a.title.compareTo(b.title));
          },
          descending: () {
            notes.sort((a, b) => b.title.compareTo(a.title));
          },
        );
      },
      date: (orderType) {
        orderType.when(
          ascending: () {
            notes.sort((a, b) => a.timestamp.compareTo(b.timestamp));
          },
          descending: () {
            notes.sort((a, b) => b.timestamp.compareTo(a.timestamp));
          },
        );
      },
      color: (orderType) {
        orderType.when(
          ascending: () {
            notes.sort((a, b) => a.color.compareTo(b.color));
          },
          descending: () {
            notes.sort((a, b) => b.color.compareTo(a.color));
          },
        );
      },
    );
    return notes;
  }
}
