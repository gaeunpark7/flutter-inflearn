import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm/data/model/mask_store.dart';
import 'package:flutter_mvvm/data/repository/location_repo.dart';
import 'package:flutter_mvvm/data/repository/mask_store_repo.dart';
import 'package:flutter_mvvm/data/repository/mock_location_repo.dart';
import 'package:flutter_mvvm/data/repository/mock_store_repo.dart';

final maskStoreRepoProvider = Provider<MaskStoreRepo>((ref) => Mockstorerepo());
final locationRepoProvider = Provider<LocationRepo>(
  (ref) => MockLocationRepo(),
);

final mainViewModelProvider =
    AsyncNotifierProvider<MainViewModel, List<MaskStore>>(MainViewModel.new);

class MainViewModel extends AsyncNotifier<List<MaskStore>> {
  @override
  Future<List<MaskStore>> build() => _fetchStores();

  Future<List<MaskStore>> _fetchStores() async {
    final storeRepo = ref.read(maskStoreRepoProvider);
    final locationRepo = ref.read(locationRepoProvider);

    final stores = await storeRepo.getStore();
    final location = await locationRepo.getLocation();

    for (final store in stores) {
      store.distance = locationRepo.distanceBetween(
        store.latitude,
        store.longitude,
        location.latitude,
        location.longitude,
      );
    }

    stores.sort((a, b) => a.distance.compareTo(b.distance));
    return stores;
  }

  Future<void> fetchStores() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetchStores);
  }
}

// class MainViewModel {
//   final MaskStoreRepo _storeRepo;
//   final LocationRepo _locationRepo;

//   MainViewModel({
//     required MaskStoreRepo storeRepo,
//     required LocationRepo locationRepo,
//   }) : _storeRepo = storeRepo,
//        _locationRepo = locationRepo;

//   //상태
//   final List<MaskStore> _store = [];
//   bool _isLoading = false;

//   List<MaskStore> get store =>
//       List.unmodifiable(_store); //리스트는 변경 가능하기 때문에 unmodifi사용

//   bool get isLoading => _isLoading;

//   void fetchStores() async {
//     _isLoading = true;
//     final stores = await _storeRepo.getStroe();
// final location = await _locationRepo.getLocation();

//     _isLoading = false;
//   }
// }
