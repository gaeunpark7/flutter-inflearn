import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_app/data/data_source/local/stock_dao.dart';
import 'package:flutter_stock_app/data/data_source/remote/stock_api.dart';
import 'package:flutter_stock_app/data/repository/stock_repository_impl.dart';
import 'package:flutter_stock_app/domain/model/company_listing.dart';
import 'package:flutter_stock_app/domain/repository/stock_repository.dart';

final dioProvider = Provider((ref) => Dio());

final apiProvider = Provider<StockApi>((ref) {
  final dio = ref.watch(dioProvider);
  return StockApi(dio: dio);
});

final daoProvider = Provider<StockDao>((ref) => StockDao());

final repoProvider = Provider<StockRepository>((ref) {
  final dao = ref.watch(daoProvider);
  final api = ref.watch(apiProvider);
  return StockRepositoryImpl(api, dao);
});

final companyNotifierProvider =
    AsyncNotifierProvider<CompanyListingsNotifier, List<CompanyListing>>(
      CompanyListingsNotifier.new,
    );

class CompanyListingsNotifier extends AsyncNotifier<List<CompanyListing>> {
  @override
  FutureOr<List<CompanyListing>> build() async {
    final repo = ref.read(repoProvider);
    final result = await repo.getCompanyListings(false, '');
    return result.when(success: (data) => data, error: (e) => throw e);
  }

  Future<void> getCompanyListing({
    bool fetchFromRemote = false,
    String query = '',
  }) async {
    state = const AsyncLoading();

    final repo = ref.read(repoProvider);
    final repoResult = await repo.getCompanyListings(fetchFromRemote, query);
    state = repoResult.when(
      success: (data) => AsyncData(data),
      error: (e) => AsyncError(e, StackTrace.current),
    );
  }
}
