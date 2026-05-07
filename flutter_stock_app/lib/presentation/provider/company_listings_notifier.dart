import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_app/di/provider_setup.dart';
import 'package:flutter_stock_app/domain/model/company_listing.dart';

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

  //불러오기
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

  //검색하기
  Future<void> searchListing(String query) async {
    final trimmed = query.trim();

    if (trimmed.isEmpty) {
      // state = AsyncData([]);
      return await getCompanyListing(); //비어있을 때 전체 목록
    }

    state = const AsyncLoading();
    final repo = ref.read(repoProvider);
    final repoResult = await repo.getCompanyListings(false, trimmed);
    state = repoResult.when(
      success: (data) => AsyncData(data),
      error: (e) => AsyncError(e, StackTrace.current),
    );
  }
}
