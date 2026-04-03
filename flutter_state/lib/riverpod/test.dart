//asyncNotifier 비동기 CRUD
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test.g.dart';

@riverpod
class Test extends AsyncNotifier<List<String>> {
  @override
  FutureOr<List<String>> build() => ['장보기', '공부하기'];

  Future<void> addTodo(String todo) async {
    // final previousState = await future;
    // state= AsyncData([...previousState, todo]);
    state = await AsyncValue.guard(() async {
      final previousState = await future;
      return [...previousState, todo];
    });
  }

  Future<void> deleteTodo(int index) async {
    state = await AsyncValue.guard(() async {
      final data = await future;
      if (index < 0 || index >= data.length) {
        throw IndexError.withLength(index, data.length, name: 'todoIndex');
      }
      return [
        for (int i = 0; i < data.length; i++)
          if (i != index) data[i],
      ];
    });
  }

  Future<void> refreshTodo() async {
    ref.invalidateSelf();
    await future;
  }
}
