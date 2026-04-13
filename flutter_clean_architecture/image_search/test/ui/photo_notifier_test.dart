import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/domain/repository/photo_repo.dart';
import 'package:image_search/presentation/riverpod/photo_notifier.dart';
import 'package:image_search/domain/model/photo_model.dart';

//성공
class FakePhotoRepo implements PhotoRepo {
  FakePhotoRepo(this.result);
  final List<PhotoModel> result;

  @override
  Future<List<PhotoModel>> getPhoto(String query) async {
    // return <PhotoModel>[];
    return result;
  }
}

//실패
class ThrowingPhotoRepo implements PhotoRepo {
  @override
  Future<List<PhotoModel>> getPhoto(String query) {
    throw Exception('boom');
  }
}

void main() {
  test('search 성공이면 AsyncData([])가 된다', () async {
    final container = ProviderContainer(
      overrides: [
        photoRepoProvider.overrideWithValue(FakePhotoRepo(<PhotoModel>[])),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(photoNotifierProvider.notifier);
    await notifier.search('apple');

    final state = container.read(photoNotifierProvider);

    expect(state, isA<AsyncData<List<PhotoModel>>>());
    expect(state.value, isEmpty);
  });

  test('search 실패해도 throw가 아니라 state가 AsyncError가 된다(guard 때문)', () async {
    final container = ProviderContainer(
      overrides: [photoRepoProvider.overrideWithValue(ThrowingPhotoRepo())],
    );
    addTearDown(container.dispose);

    final notifier = container.read(photoNotifierProvider.notifier);
    await notifier.search('apple');

    final state = container.read(photoNotifierProvider);
    expect(state, isA<AsyncError<List<PhotoModel>>>());
  });

  test('빈 문자열이면 결과가 빈 리스트로 리셋된다', () async {
    final container = ProviderContainer(
      overrides: [
        photoRepoProvider.overrideWithValue(FakePhotoRepo(<PhotoModel>[])),
      ],
    );
    addTearDown(container.dispose);

    await container.read(photoNotifierProvider.notifier).search('   ');

    final state = container.read(photoNotifierProvider);
    expect(state.value, isEmpty);
  });

  test('가짜 데이터 2개가 state에 들어간다', () async {
    final fakeResult = [fakePhoto(id: 10), fakePhoto(id: 20)];

    final container = ProviderContainer(
      overrides: [
        photoRepoProvider.overrideWithValue(FakePhotoRepo(fakeResult)),
      ],
    );
    addTearDown(container.dispose);

    await container.read(photoNotifierProvider.notifier).search('apple');

    final state = container.read(photoNotifierProvider);

    expect(state, isA<AsyncData<List<PhotoModel>>>());
    expect(state.value?.length, 2);
    expect(state.value?.first.id, 10);
  });
}

//------------- 가짜 photoModel
PhotoModel fakePhoto({int id = 1}) {
  return PhotoModel(
    id: id,
    // pageURL: 'p',
    // type: 'photo',
    tags: 't',
    previewUrl: 'p',
    // previewWidth: 1,
    // previewHeight: 1,
    // webformatURL: 'w',
    // webformatWidth: 1,
    // webformatHeight: 1,
    // largeImageURL: 'l',
    // imageWidth: 1,
    // imageHeight: 1,
    // imageSize: 1,
    // views: 1,
    // downloads: 1,
    // collections: 1,
    // likes: 1,
    // comments: 1,
    // userId: 1,
    // user: 'u',
    // userImageURL: 'i',
    // noAiTraining: false,
    // isAiGenerated: false,
    // isGRated: false,
    // isLowQuality: false,
    // userURL: 'url',
    // name: 'n',
  );
}
