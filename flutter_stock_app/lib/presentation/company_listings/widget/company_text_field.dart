import 'package:flutter/material.dart';

class CompanyTextField extends StatelessWidget {
  const CompanyTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        labelText: '검색...',
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
