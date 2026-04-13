import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/domain/repository/photo_repo.dart';
import 'package:image_search/data/repository/pixabay_photo_repo_impl.dart';
import 'package:image_search/domain/model/photo_model.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late PhotoRepo repo;

  const baseUrl = 'https://pixabay.com/api/';
  const key = 'test-key';

  setUp(() {
    dio = Dio();
    adapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = adapter;

    final api = PixabayApi(dio: dio, baseUrl: baseUrl, key: key);
    repo = PixabayPhotoRepo(api: api);
  });

  test('검색어 "apple"을 던지면 정확한 파라미터로 요청하고 모델로 변환해야 한다', () async {
    final fakeResponse = {
      'hits': [
        {
          'id': 10,
          'pageURL': 'p',
          'type': 'photo',
          'tags': 'apple',
          'previewURL': 'p',
          'previewWidth': 1,
          'previewHeight': 1,
          'webformatURL': 'w',
          'webformatWidth': 1,
          'webformatHeight': 1,
          'largeImageURL': 'l',
          'imageWidth': 1,
          'imageHeight': 1,
          'imageSize': 1,
          'views': 1,
          'downloads': 1,
          'collections': 1,
          'likes': 1,
          'comments': 1,
          'user_id': 1,
          'user': 'u',
          'userImageURL': 'i',
          'noAiTraining': false,
          'isAiGenerated': false,
          'isGRated': false,
          'isLowQuality': false,
          'userURL': 'url',
          'name': 'n',
        },
      ],
    };

    adapter.onGet(
      baseUrl,
      (server) => server.reply(200, fakeResponse),
      queryParameters: {'key': key, 'q': 'apple', 'image_type': 'photo'},
    );

    // When: 실행
    final photos = await repo.getPhoto('apple');
    // Then: 검증
    expect(photos, isA<List<PhotoModel>>());
    expect(photos.first.id, 10);
  });
}
