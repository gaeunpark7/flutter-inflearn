import 'package:flutter/material.dart';

// ignore: camel_case_types
class addTextField extends StatelessWidget {
  final TextEditingController controller;
  final double textSize;
  final String hintText;
  final int? maxLine;

  const addTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.textSize = 16,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: textSize),
      maxLines: maxLine,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
