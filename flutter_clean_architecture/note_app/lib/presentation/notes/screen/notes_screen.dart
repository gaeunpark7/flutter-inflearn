import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/presentation/notes/riverpod/note_notifier.dart';
import 'package:note_app/presentation/notes/screen/add_edit_screen.dart';
import 'package:note_app/presentation/notes/common/note_colors.dart';
import 'package:note_app/presentation/notes/widget/note_item.dart';
import 'package:note_app/presentation/notes/widget/order_section.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({super.key});

  @override
  ConsumerState<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  bool _isOrderSectionVisible = false;

  @override
  Widget build(BuildContext context) {
    final notesAsync = ref.watch(noteNotifierProvider);
    final noteOrder = ref.watch(noteOrderProvider);

    return Scaffold(
      backgroundColor: darkGray,
      appBar: AppBar(
        backgroundColor: darkGray,
        title: Text(
          'Your note',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isOrderSectionVisible = !_isOrderSectionVisible;
              });
            },
            icon: Icon(Icons.sort, color: Colors.white),
          ),
        ],
      ),
      body: notesAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
        data: (notes) => ListView(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _isOrderSectionVisible
                  ? OrderSection(
                      key: const ValueKey('order_section'),
                      noteOrder: noteOrder,
                      onOrderChange: (order) {
                        ref
                            .read(noteNotifierProvider.notifier)
                            .changeOrder(order);
                      },
                    )
                  : const SizedBox.shrink(
                      key: ValueKey('order_section_hidden'),
                    ),
            ),
            for (final note in notes)
              GestureDetector(
                onTap: () async {
                  final saves = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => AddEditScreen(note: note),
                    ),
                  );
                  if (saves == true) {
                    ref.invalidate(noteNotifierProvider);
                  }
                },
                child: NoteItem(
                  note: note,
                  onDeleteTap: () {
                    ref.read(noteNotifierProvider.notifier).deleteNote(note);
                    final snackBar = SnackBar(
                      content: const Text('노트가 삭제되었습니다.'),
                      action: SnackBarAction(
                        label: '취소',
                        onPressed: () {
                          ref.read(noteNotifierProvider.notifier).restoreNote();
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          final saves = await Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => AddEditScreen()),
          );
          if (saves == true) {
            ref.invalidate(noteNotifierProvider);
          }
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
