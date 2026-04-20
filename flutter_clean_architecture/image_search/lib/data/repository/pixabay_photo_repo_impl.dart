import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/domain/common/result.dart';
import 'package:image_search/domain/repository/photo_repo.dart';
import 'package:image_search/domain/model/photo_model.dart';

class PixabayPhotoRepo implements PhotoRepo {
  PixabayPhotoRepo({required this.api});
  final PixabayApi api;

  @override
  Future<Result<List<PhotoModel>>> getPhoto(String query) async {
    final Result<List<Map<String, dynamic>>> data = await api.fetchData(query);

    return data.when(
      success: (jsonList) {
        final data = jsonList.map(PhotoModel.fromJson).toList();
        return Result.success(data);
      },
      error: (message) => Result.error(message),
    );
  }
}
