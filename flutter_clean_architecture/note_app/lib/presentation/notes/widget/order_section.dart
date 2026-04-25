import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/domain/util/note_order.dart';

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
    return Container();
  }
}
