import 'package:flutter_mvvm/data/data_source/todo_api.dart';
import 'package:flutter_mvvm/data/model/todo_model.dart';

class TodoRepo {
  final TodoApi api;
  TodoRepo(this.api);

  Future<List<TodoModel>> getTodos() async {
    final data = await api.fetchData();
    return data.map((e) => TodoModel.fromJson(e)).toList();
  }

  Future<List<TodoModel>> getCompletedTodos() async {
    final data = await api.fetchData();
    return data
        .where((e) => e['completed'] == true)
        .map(TodoModel.fromJson)
        .toList();
  }
}

void main() {
  final repo = TodoRepo(TodoApi());
  final result = repo.getCompletedTodos();
}
