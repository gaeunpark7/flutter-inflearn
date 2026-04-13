import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_repo.dart';
import 'package:image_search/domain/model/photo_model.dart';

class PixabayPhotoRepo implements PhotoRepo {
  PixabayPhotoRepo({required this.api});
  final PixabayApi api;

  @override
  Future<List<PhotoModel>> getPhoto(String query) async {
    final Result data = await api.fetchData(query);

    return data.when(
      success: (data) => data.map(PhotoModel.fromJson).toList(),
      error: (message) => throw Exception(message),
    );
  }
}
