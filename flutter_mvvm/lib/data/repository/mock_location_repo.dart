import 'package:flutter_mvvm/data/model/location.dart';
import 'package:flutter_mvvm/data/repository/location_repo.dart';

class MockLocationRepo implements LocationRepo {
  @override
  Future<Location> getLocation() async {
    return Location(latitude: 0, longitude: 0);
  }

  @override
  double distanceBetween(
    double startLat,
    double startLng,
    double endLnt,
    double endLng,
  ) {
    return 0; // 일단 학습용: 0m로 고정
  }
}
