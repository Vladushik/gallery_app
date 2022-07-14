import 'package:gallery_app/features/gallery/data/models/photo_model.dart';

abstract class GalleryState {}

class GalleryInitial extends GalleryState {}

class GalleryLoadingState extends GalleryState {}

class GalleryLoadedState extends GalleryState {
  List<PhotoModel> loadedPhotos;
  GalleryLoadedState({required this.loadedPhotos});
}

class GalleryErrorState extends GalleryState {}
