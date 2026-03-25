import 'package:flutter_mvvm/data/data_source/posts_api.dart';
import 'package:flutter_mvvm/data/model/posts_model.dart';

class PostsRepo {
  final PostsApi api;
  PostsRepo(this.api);

  Future<List<PostsModel>> getPost(int page, int limit) async {
    page = 1;
    page = 3;
    final data = await api.fetchData(page, limit);

    return data.map(PostsModel.fromJson).toList();
  }
}
//한 페이지가 limit 갯수만큼 나오고, page번째 페이지의 내용을 표시
//page는 1부터 시작, 1보다 작은 값을 입력하면 1로 