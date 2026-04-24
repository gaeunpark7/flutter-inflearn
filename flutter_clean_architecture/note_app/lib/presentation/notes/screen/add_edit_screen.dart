import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/presentation/notes/riverpod/add_edit_notifier.dart';
import 'package:note_app/presentation/notes/riverpod/selected_color_notifier.dart';
import 'package:note_app/presentation/notes/widget/add__background_color.dart';
import 'package:note_app/presentation/notes/widget/add_text_field.dart';
import 'package:note_app/presentation/notes/common/note_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddEditScreen extends ConsumerStatefulWidget {
  final Note? note;
  const AddEditScreen({super.key, this.note});

  @override
  ConsumerState<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends ConsumerState<AddEditScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  // Color _color = roseBud;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final saveState = ref.watch(addEditNotifierProvider);

    final selectedColorValue = ref.watch(selectedColorProvider);
    final selectedColor = Color(selectedColorValue);

    return Scaffold(
      body: AnimatedContainer(
        padding: const EdgeInsets.only(
          top: 48,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        color: selectedColor,
        duration: Duration(milliseconds: 500),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: noteColors
                  .map(
                    (color) => InkWell(
                      onTap: () {
                        ref
                            .read(selectedColorProvider.notifier)
                            .setColor(color.value);
                      },
                      child: AddBackgroundColor(
                        color: color,
                        seleted: selectedColor == color,
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
        onPressed: () async {
          if (_titleController.text.isEmpty ||
              _contentController.text.isEmpty) {
            final snackBar = SnackBar(content: Text('제목이나 내용이 비어있습니다.'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          await ref
              .read(addEditNotifierProvider.notifier)
              .saveNote(
                widget.note?.id,
                _titleController.text,
                _contentController.text,
              );
          if (context.mounted) {
            Navigator.pop(context, true);
          }
        },
        shape: CircleBorder(),
        child: Icon(Icons.save),
      ),
    );
  }
}
