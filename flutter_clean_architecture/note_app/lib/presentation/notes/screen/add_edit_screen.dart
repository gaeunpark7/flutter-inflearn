import 'package:flutter/material.dart';
import 'package:note_app/presentation/notes/widget/add__background_color.dart';
import 'package:note_app/presentation/notes/widget/add_text_field.dart';
import 'package:note_app/presentation/notes/common/note_colors.dart';

class AddEditScreen extends StatefulWidget {
  const AddEditScreen({super.key});

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  Color _color = roseBud;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        padding: const EdgeInsets.only(
          top: 48,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        color: _color,
        duration: Duration(milliseconds: 500),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: noteColors
                  .map(
                    (color) => InkWell(
                      onTap: () {
                        setState(() {
                          _color = color;
                        });
                      },
                      child: AddBackgroundColor(
                        color: color,
                        seleted: _color == color,
                      ),
                    ),
                  )
                  .toList(),
            ),
            addTextField(
              controller: _titleController,
              hintText: '제목을 입력하세요',
              textSize: 30,
              maxLine: 1,
            ),
            addTextField(controller: _contentController, hintText: '내용을 입력하세요'),
          ],
        ),
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
        child: Icon(Icons.save),
      ),
    );
  }
}
