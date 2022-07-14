import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/features/gallery/presentation/bloc/bloc.dart';
import 'package:gallery_app/features/gallery/data/repositories/gallery_repository_impl.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryRepositoryImpl repository;

  GalleryBloc({required this.repository}) : super(GalleryInitial()) {
    on<GalleryLoadEvent>((event, emit) async {
      emit(GalleryLoadingState());
      try {
        var loadedPhotos = await repository.getPhotos();
        emit(GalleryLoadedState(loadedPhotos: loadedPhotos));
      } catch (_) {
        emit(GalleryErrorState());
      }
    });
  }
}
