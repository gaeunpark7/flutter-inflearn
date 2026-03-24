import 'package:flutter_mvvm/data/data_source/album_api.dart';
import 'package:flutter_mvvm/data/model/album_model.dart';

class AlbumRepository {
  final AlbumApi api;
  AlbumRepository(this.api);

  Future<List<AlbumModel>> getAlbum() async {
    final data = await api.fetchData();
    return data.map(AlbumModel.fromJson).toList();
  }

  Future<List<AlbumModel>> getAlbumTop10() async {
    final data = await api.fetchData();
    return data.map(AlbumModel.fromJson).toList().take(10).toList();
  }
}
