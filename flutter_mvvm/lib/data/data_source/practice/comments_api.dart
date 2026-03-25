import 'package:dio/dio.dart';

class CommentsApi {
  final dio = Dio();

  Future<List<Map<String, dynamic>>> fetchCommentApi(int postId) async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/comments',
      queryParameters: {'postId': postId},
    );

    return List<Map<String, dynamic>>.from(response.data);
  }
}
