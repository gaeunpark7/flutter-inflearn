import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_search/di/provider_setup.dart';
import 'package:image_search/domain/common/result.dart';
import 'package:image_search/domain/model/photo_model.dart';
import 'package:image_search/presentation/home/screen/home_ui_event.dart';

final photoNotifierProvider =
    AsyncNotifierProvider<PhotoNotifier, List<PhotoModel>>(PhotoNotifier.new);

//photoRiverpod
class PhotoNotifier extends AsyncNotifier<List<PhotoModel>> {
  //event Controller
  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  //build
  @override
  Future<List<PhotoModel>> build() async {
    ref.onDispose(_eventController.close);
    return <PhotoModel>[];
  }

  Future<void> search(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      state = const AsyncData(<PhotoModel>[]);
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(getPhotosUseCaseProvider);
      final result = await useCase.execute(trimmed);

      return result.when(
        success: (photos) => photos,
        error: (message) {
          _eventController.add(HomeUiEvent.showSnackBar(message));
          // return state.value ?? <PhotoModel>[];
          throw Exception(message);
        },
      );
    });
  }
}
