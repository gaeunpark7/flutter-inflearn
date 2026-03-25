import 'package:flutter_mvvm/data/model/mask_store.dart';
import 'package:flutter_mvvm/data/repository/mock_store_repo.dart';
import 'package:provider/provider.dart';

abstract interface class MaskStoreRepo {
  Future<List<MaskStore>> getStore();
}
