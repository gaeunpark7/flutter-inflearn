import 'package:flutter_mvvm/data/model/location.dart';

abstract interface class LocationRepo {
  Future<Location> getLocation();
  double distanceBetween(
    double startLat,
    double startLng,
    double endLnt,
    double endLng,
  );
}
