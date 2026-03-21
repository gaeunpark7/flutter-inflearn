import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    return ['장보기', '공부하기'];
  }

  Future<void> addTodo(String todo) async {
    final previousState = await future;
    state = AsyncData([...previousState, todo]);
  }
}

final todoListProvider = AsyncNotifierProvider<TodoList, List<String>>(
  TodoList.new,
);
