import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends Notifier<int> {
  @override
  build() => 0;

  void increment() {
    state++;
  }
}

