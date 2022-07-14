import 'package:gallery_app/features/gallery/data/models/photo_model.dart';
import 'package:gallery_app/features/gallery/domain/repositories/gallery_repository.dart';
import 'package:dio/dio.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  static const String _apiKey =
      'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';
  static const String _url =
      'https://api.unsplash.com/photos/?client_id=$_apiKey';

  @override
  Future<List<PhotoModel>> getPhotos() async {
    try {
      Response response = await Dio().get(_url);
      return (response.data as List)
          .map((x) => PhotoModel.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception: $error stackTrace: $stacktrace");
    }
  }
}
