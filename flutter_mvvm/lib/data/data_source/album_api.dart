import 'package:dio/dio.dart';

class AlbumApi {
  final dio = Dio();
  Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/albums',
    );

    return List<Map<String, dynamic>>.from(response.data);
  }
}
