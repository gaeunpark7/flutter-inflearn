import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherProvider = FutureProvider<String>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return '맑음';
});
