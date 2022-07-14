import 'package:gallery_app/features/gallery/data/repositories/gallery_repository_impl.dart';
import 'package:gallery_app/features/gallery/presentation/bloc/gallery_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => GalleryBloc(repository: sl()));
  sl.registerLazySingleton(() => GalleryRepositoryImpl());
}
