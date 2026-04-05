import 'package:flutter/material.dart';
import 'package:image_search/model/photo_model.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({super.key, required this.photo});

  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(photo.previewURL),
          fit: BoxFit.cover,
        ),
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
