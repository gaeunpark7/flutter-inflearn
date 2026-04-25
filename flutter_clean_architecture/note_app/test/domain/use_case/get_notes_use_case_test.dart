import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/domain/use_case/get_note_use_case.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/order_type.dart';
import 'get_notes_use_case_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  test('정렬 기능이 잘 동작해야한다.', () async {
    final repository = MockNoteRepository();
    final getNotes = GetNotesUseCase(repository);

    //동작 정의
    when(repository.getNote()).thenAnswer(
      (_) async => [
        Note(title: 'title', content: 'content', timestamp: 0, color: 1),
        Note(title: 'title', content: 'content', timestamp: 2, color: 2),
      ],
    );
    List<Note> result = await getNotes(NoteOrder.date(OrderType.descending()));

    expect(result, isA<List<Note>>()); //타입 검사

    expect(result.first.timestamp, 2);
    verify(repository.getNote());

    result = await getNotes(NoteOrder.date(OrderType.ascending()));
    expect(result.first.timestamp, 0);
    verify(repository.getNote());

    //title
    result = await getNotes(NoteOrder.title(OrderType.ascending()));
    expect(result.first.title, 'title');
    verify(repository.getNote());

    result = await getNotes(NoteOrder.title(OrderType.descending()));
    expect(result.first.title, 'title');
    verify(repository.getNote());

    //color
    result = await getNotes(NoteOrder.color(OrderType.ascending()));
    expect(result.first.color, 1);
    verify(repository.getNote());

    result = await getNotes(NoteOrder.color(OrderType.descending()));
    expect(result.first.color, 2);
    verify(repository.getNote());

    verifyNoMoreInteractions(repository);
  });
}
