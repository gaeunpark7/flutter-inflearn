import 'package:image_search/domain/common/result.dart';
import 'package:image_search/domain/model/photo_model.dart';
import 'package:image_search/domain/repository/photo_repo.dart';

class GetPhotosUseCase {
  final PhotoRepo repository;

  GetPhotosUseCase(this.repository);

  Future<Result<List<PhotoModel>>> execute(String query) async {
    final result = await repository.getPhoto(query);
    return result.when(
      success: (photos) =>
          Result.success(photos.take(3).toList()), //sublist(0,3)
      error: (message) => Result.error(message),
    );
  }
}
