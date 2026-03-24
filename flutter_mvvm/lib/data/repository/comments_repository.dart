import 'package:flutter_mvvm/data/data_source/comments_api.dart';
import 'package:flutter_mvvm/data/model/comments.dart';

class CommentsRepository {
  final CommentsApi api;
  CommentsRepository(this.api);

  Future<List<Comments>> getComments(int postId) async {
    final data = await api.fetchCommentApi(postId);
    return data.map((e) => Comments.fromJson(e)).toList(); //1:1 변환
  }
}

void main() async {
  final repo = CommentsRepository(CommentsApi());
  final result = await repo.getComments(1);
  print(result);
}
