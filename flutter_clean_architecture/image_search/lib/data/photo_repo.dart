import 'package:dio/dio.dart';
import 'package:image_search/model/photo_model.dart';

class PhotoRepo {
  final _dio = Dio();
  final baseUrl = 'https://pixabay.com/api/';
  final key = '19662278-494facaf0e58a722575fb5cdf';

  Future<List<Map<String, dynamic>>> fetchData(String query) async {
    final response = await _dio.get(
      baseUrl,
      queryParameters: {'key': key, 'q': query, 'image_type': 'photo'},
    );

    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw StateError('Unexpected response type: ${data.runtimeType}');
    }

    final hits = data['hits'];
    if (hits is! List) {
      throw StateError('Unexpected hits type: ${hits.runtimeType}');
    }

    return hits.whereType<Map<String, dynamic>>().toList();
  }

  Future<List<PhotoModel>> getPhoto(String query) async {
    final data = await fetchData(query);
    return data.map(PhotoModel.fromJson).toList();
  }
}
