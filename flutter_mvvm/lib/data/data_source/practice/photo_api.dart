import 'package:dio/dio.dart';

class PhotoApi {
  final dio = Dio();

  Future<List<Map<String, dynamic>>> fetchData() async {
    final reponse = await dio.get(
      'https://jsonplaceholder.typicode.com/photos',
    );
    return List<Map<String, dynamic>>.from(reponse.data);
  }
}
