import 'package:dio/dio.dart';
import 'package:image_search/domain/common/result.dart';

class PixabayApi {
  PixabayApi({
    Dio? dio,
    this.baseUrl = 'https://pixabay.com/api/',
    this.key = '19662278-494facaf0e58a722575fb5cdf',
  }) : _dio = dio ?? Dio();

  final Dio _dio;
  final String baseUrl;
  final String key;

  Future<Result<List<Map<String, dynamic>>>> fetchData(String query) async {
    try {
      final response = await _dio.get(
        baseUrl,
        queryParameters: {'key': key, 'q': query, 'image_type': 'photo'},
      );
      final data = List<Map<String, dynamic>>.from(response.data['hits']);
      // return List<Map<String, dynamic>>.from(response.data['hits']);

      return Result.success(data);
    } catch (e) {
      return Result.error('네트워크 에러');
    }
  }
}
