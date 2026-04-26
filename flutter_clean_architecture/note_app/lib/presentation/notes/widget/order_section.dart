import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/order_type.dart';

class OrderSection extends ConsumerWidget {
  final NoteOrder noteOrder;
  final Function(NoteOrder) onOrderChange;
  const OrderSection({
    super.key,
    required this.noteOrder,
    required this.onOrderChange,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            Radio<NoteOrder>(
              value: NoteOrder.title(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChange(NoteOrder.title(noteOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text('title', style: TextStyle(color: Colors.white)),
            Radio<NoteOrder>(
              value: NoteOrder.date(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChange(NoteOrder.date(noteOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text('date', style: TextStyle(color: Colors.white)),
            Radio<NoteOrder>(
              value: NoteOrder.color(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChange(NoteOrder.color(noteOrder.orderType));
              },
              activeColor: Colors.white,
            ),
            const Text('color', style: TextStyle(color: Colors.white)),
          ],
        ),
        Row(
          children: [
            Radio<OrderType>(
              value: OrderType.ascending(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? value) {
                onOrderChange(
                  noteOrder.copyWith(orderType: OrderType.ascending()),
                );
              },
              activeColor: Colors.white,
            ),
            const Text('Asc', style: TextStyle(color: Colors.white)),
            Radio<OrderType>(
              value: OrderType.descending(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? value) {
                onOrderChange(
                  noteOrder.copyWith(orderType: OrderType.descending()),
                );
              },
              activeColor: Colors.white,
            ),
            const Text('Desc', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
