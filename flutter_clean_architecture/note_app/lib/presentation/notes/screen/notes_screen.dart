import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/presentation/notes/screen/add_edit_screen.dart';
import 'package:note_app/presentation/notes/common/note_colors.dart';
import 'package:note_app/presentation/notes/widget/note_item.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          NoteItem(
            note: Note(
              title: 'title1fd;gk;dlfkg;lskgl;jsdjgksj;ljgd;ljlkjd;kfl;',
              content: 'content1',
              color: wisteria.value,
              timestamp: 1,
            ),
          ),
          NoteItem(
            note: Note(
              title: 'title2',
              content: 'content2',
              color: skyBlue.value,
              timestamp: 1,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => AddEditScreen()),
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
