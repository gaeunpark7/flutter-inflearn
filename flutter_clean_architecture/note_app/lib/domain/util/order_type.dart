import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_type.freezed.dart';

@freezed
sealed class OrderType with _$OrderType {
  factory OrderType.ascending() = Ascending;
  factory OrderType.descending() = Descending;
}
