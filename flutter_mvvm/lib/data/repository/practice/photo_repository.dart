import 'package:flutter_mvvm/data/data_source/photo_api.dart';
import 'package:flutter_mvvm/data/model/photo_model.dart';

class PhotoRepository {
  final PhotoApi api;
  PhotoRepository(this.api);

  Future<List<PhotoModel>> getPhoto() async {
    final data = await api.fetchData();
    return data.map(PhotoModel.fromJson).toList();
  }
}
