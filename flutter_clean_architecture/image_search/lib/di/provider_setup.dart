import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/repository/pixabay_photo_repo_impl.dart';
import 'package:image_search/domain/repository/photo_repo.dart';
import 'package:image_search/domain/use_case/get_photos_use_case.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final pixabayApiProvider = Provider<PixabayApi>((ref) {
  final dio = ref.watch(dioProvider);
  return PixabayApi(dio: dio);
});

final photoRepoProvider = Provider<PhotoRepo>((ref) {
  final api = ref.watch(pixabayApiProvider);
  return PixabayPhotoRepo(api: api);
});

final getPhotosUseCaseProvider = Provider<GetPhotosUseCase>((ref) {
  final repo = ref.watch(photoRepoProvider);
  return GetPhotosUseCase(repo);
});
