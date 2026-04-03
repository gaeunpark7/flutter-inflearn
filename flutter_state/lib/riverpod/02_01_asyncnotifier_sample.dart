import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends AsyncNotifier<List<String>> {
  @override
  Future<List<String>> build() async {
    return ['장보기', '공부하기'];
  }

  Future<List<String>> _getCurrentOrFutureTodos() async {
    final current = state.asData?.value;
    if (current != null) {
      return current;
    }
    return await future;
  }

  Future<void> createTodo(String todo) async {
    final previousState = await _getCurrentOrFutureTodos();
    state = AsyncData([...previousState, todo]);
  }

  Future<void> addTodo(String todo) async {
    await createTodo(todo);
  }

  Future<void> deleteTodo(int index) async {
    final previousState = await _getCurrentOrFutureTodos();
    if (index < 0 || index >= previousState.length) {
      return;
    }
    final nextState = [...previousState]..removeAt(index);
    state = AsyncData(nextState);
  }

  Future<void> refreshTodos() async {
    ref.invalidateSelf();
    await future;
  }
}

final todoListProvider = AsyncNotifierProvider<TodoList, List<String>>(
  TodoList.new,
);
