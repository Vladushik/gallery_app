import 'package:flutter/material.dart';
import 'package:gallery_app/core/resources/resources.dart';
import 'package:gallery_app/features/gallery/data/models/photo_model.dart';
import 'package:gallery_app/features/gallery/presentation/pages/photo_page.dart';

class PhotoItemWidget extends StatelessWidget {
  final PhotoModel photoModel;

  const PhotoItemWidget({
    required this.photoModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userName = photoModel.user!.username!;
    var profileImage = photoModel.user!.profileImage!.medium!;
    var image = photoModel.urls!.thumb!;
    var likes = photoModel.likes!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(ConstantsApp.mPadding),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(ConstantsApp.borderRadius),
                child: Image.network(
                  profileImage,
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(width: 8),
              Column(children: [Text(userName), Text(userName)]),
              const Spacer(),
              const Icon(Icons.menu),
            ],
          ),
        ),
        InkWell(
          child: Image.network(image),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoPage(photoModel: photoModel),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(ConstantsApp.mPadding),
          child: Row(
            children: const [
              Icon(Icons.favorite_border_outlined),
              SizedBox(width: 8),
              Icon(Icons.message_outlined),
              SizedBox(width: 8),
              Icon(Icons.telegram_outlined),
              Spacer(),
              Icon(Icons.bookmark_border_outlined),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: ConstantsApp.mPadding,
            left: ConstantsApp.mPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('$likes likes'),
            ],
          ),
        ),
      ],
    );
  }
}
