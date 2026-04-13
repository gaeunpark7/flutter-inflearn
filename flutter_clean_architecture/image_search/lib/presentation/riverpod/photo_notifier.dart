import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/domain/repository/photo_repo.dart';
import 'package:image_search/data/repository/pixabay_photo_repo_impl.dart';
import 'package:image_search/domain/model/photo_model.dart';

final photoRepoProvider = Provider<PhotoRepo>(
  (ref) => PixabayPhotoRepo(api: PixabayApi()),
);

final photoNotifierProvider =
    AsyncNotifierProvider<PhotoNotifier, List<PhotoModel>>(PhotoNotifier.new);

class PhotoNotifier extends AsyncNotifier<List<PhotoModel>> {
  late final PhotoRepo _photoRepo;

  @override
  Future<List<PhotoModel>> build() async {
    _photoRepo = ref.watch(photoRepoProvider);
    return <PhotoModel>[];
  }

  Future<void> search(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      state = const AsyncData(<PhotoModel>[]);
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _photoRepo.getPhoto(trimmed));
  }
}
