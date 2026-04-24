import 'package:flutter/material.dart';

Widget AddBackgroundColor({required Color color, required bool seleted}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
        border: seleted ? Border.all(color: Colors.black, width: 1.5) : null,
      ),
    ),
  );
}
