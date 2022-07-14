import 'package:flutter/material.dart';
import 'package:gallery_app/features/gallery/data/models/photo_model.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({
    required this.photoModel,
    Key? key,
  }) : super(key: key);

  final PhotoModel photoModel;

  @override
  Widget build(BuildContext context) {
    var image = photoModel.urls!.full!;
    return Scaffold(
      body: Center(
        child: Image.network(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
