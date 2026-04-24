import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/presentation/notes/riverpod/note_notifier.dart';
import 'package:note_app/presentation/notes/screen/add_edit_screen.dart';
import 'package:note_app/presentation/notes/common/note_colors.dart';
import 'package:note_app/presentation/notes/widget/note_item.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({super.key});

  @override
  ConsumerState<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    final notesAsync = ref.watch(noteNotifierProvider);

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
            onPressed: () {},
            icon: Icon(Icons.sort, color: Colors.white),
          ),
        ],
      ),
      body: notesAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
        data: (notes) => ListView(
          children: [for (final note in notes) NoteItem(note: note)],
          // children: [
          //   NoteItem(
          //     note: Note(
          //       title: 'title1fd;gk;dlfkg;lskgl;jsdjgksj;ljgd;ljlkjd;kfl;',
          //       content: 'content1',
          //       color: wisteria.value,
          //       timestamp: 1,
          //     ),
          //   ),
          //   NoteItem(
          //     note: Note(
          //       title: 'title2',
          //       content: 'content2',
          //       color: skyBlue.value,
          //       timestamp: 1,
          //     ),
          //   ),
          // ],
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
