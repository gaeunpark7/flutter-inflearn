import 'package:image_search/domain/common/result.dart';
import 'package:image_search/domain/model/photo_model.dart';

abstract interface class PhotoRepo {
  Future<Result<List<PhotoModel>>> getPhoto(String query);
}
