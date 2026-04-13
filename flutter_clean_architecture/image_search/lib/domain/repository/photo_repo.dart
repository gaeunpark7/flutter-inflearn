import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/model/photo_model.dart';

abstract interface class PhotoRepo {
  Future<List<PhotoModel>> getPhoto(String query);
}
