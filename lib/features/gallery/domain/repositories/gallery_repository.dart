import 'package:gallery_app/features/gallery/data/models/photo_model.dart';

abstract class GalleryRepository {
  Future<List<PhotoModel>> getPhotos();
}
