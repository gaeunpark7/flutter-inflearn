import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/domain/util/order_type.dart';

part 'note_order.freezed.dart';

@freezed
sealed class NoteOrder with _$NoteOrder {
  factory NoteOrder.title(OrderType orderType) = NoteOrderTitle;
  factory NoteOrder.date(OrderType orderType) = NoteOrderDate;
  factory NoteOrder.color(OrderType orderType) = NoteOrderColor;
}
