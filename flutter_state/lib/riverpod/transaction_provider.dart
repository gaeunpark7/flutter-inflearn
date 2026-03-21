import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_generator/builder.dart';

part 'transaction_provider.g.dart';

@riverpod
class TransactionList extends _$TransactionList {
  // 이 부분이 기존의 AsyncNotifier 역할을 합니다.
  @override
  Future<List<String>> build() async {
    return ['식비 10,000원', '교통비 2,500원'];
  }

  void add(String item) {
    // state.value는 현재 데이터를 의미합니다.
    state = AsyncData([...state.value ?? [], item]);
  }
}
