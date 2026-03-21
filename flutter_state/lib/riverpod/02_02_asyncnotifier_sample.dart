import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }

  final int userId;
  final int id;
  final String title;
  final bool completed;

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'completed': completed,
  };
}

final Dio _dio = Dio(
  // 기본 옵션
  BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com', //기본 주소
    connectTimeout: Duration(seconds: 3), //연결 대기 시간
    receiveTimeout: Duration(seconds: 3), //응답 대기시간
  ),
);

//AsyncNotifier
class TodoList extends AsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() => _fetchTodos();

  Future<List<Todo>> _fetchTodos() async {
    final response = await _dio.get<List<dynamic>>(
      '/todos',
      queryParameters: {'_limit': 10},
    );

    final data = response.data ?? const <dynamic>[];
    return data
        .map((e) => Todo.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  Future<Todo> _createTodo(String title) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/todos',
      data: {'userId': 1, 'title': title, 'completed': false},
    );

    final json = response.data ?? const <String, dynamic>{};
    final idValue = json['id'];
    final id = (idValue is int)
        ? idValue
        : DateTime.now().millisecondsSinceEpoch;

    return Todo(
      userId: (json['userId'] as int?) ?? 1,
      id: id,
      title: (json['title'] as String?) ?? title,
      completed: (json['completed'] as bool?) ?? false,
    );
  }

  Future<void> refresh() async {
    final previous = state.value;
    state = const AsyncLoading();
    try {
      state = AsyncData(await _fetchTodos());
    } catch (e, st) {
      if (previous != null) {
        state = AsyncData(previous);
      } else {
        state = AsyncError(e, st);
      }
      Error.throwWithStackTrace(e, st);
    }
  }

  Future<void> addTodo(String title) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final created = await _createTodo(title);
      // 기존 리스트에 새 아이템 추가
      return [...?state.value, created];
    });
  }

  //   final previous = state.value ?? const <Todo>[];
  //   state = const AsyncLoading();
  //   try {
  //     final created = await _createTodo(title);
  //     state = AsyncData([...previous, created]);
  //   } catch (e, st) {
  //     state = AsyncData(previous);
  //     Error.throwWithStackTrace(e, st);
  //   }
  // }
}

final todoListProvider = AsyncNotifierProvider<TodoList, List<Todo>>(
  TodoList.new,
);
