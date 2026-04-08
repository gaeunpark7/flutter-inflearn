import 'package:dio/dio.dart';
import 'package:image_search/model/photo_model.dart';

class PhotoRepo {
  PhotoRepo({
    Dio? dio,
    this.baseUrl = 'https://pixabay.com/api/',
    this.key = '19662278-494facaf0e58a722575fb5cdf',
  }) : _dio = dio ?? Dio();

  final Dio _dio;
  final String baseUrl;
  final String key;

  Future<List<Map<String, dynamic>>> fetchData(String query) async {
    final response = await _dio.get(
      baseUrl,
      queryParameters: {'key': key, 'q': query, 'image_type': 'photo'},
    );
    return List<Map<String, dynamic>>.from(response.data['hits']);
  }

  Future<List<PhotoModel>> getPhoto(String query) async {
    final data = await fetchData(query);
    return data.map(PhotoModel.fromJson).toList();
  }
}
