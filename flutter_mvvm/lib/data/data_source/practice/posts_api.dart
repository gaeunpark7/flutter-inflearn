import 'package:dio/dio.dart';

class PostsApi {
  final dio = Dio();
  Future<List<Map<String, dynamic>>> fetchData(int page, int limit) async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
      queryParameters: {'_page': page, '_limit': limit},
    );
    return List<Map<String, dynamic>>.from(response.data);
  }
}
//URL : ?_page=1&_limit=10