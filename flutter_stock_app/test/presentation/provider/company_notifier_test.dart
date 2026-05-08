import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_app/di/provider_setup.dart';
import 'package:flutter_stock_app/domain/model/company_info.dart';
import 'package:flutter_stock_app/domain/model/company_listing.dart';
import 'package:flutter_stock_app/domain/model/intraday_info.dart';
import 'package:flutter_stock_app/domain/repository/stock_repository.dart';
import 'package:flutter_stock_app/presentation/provider/company_listings_notifier.dart';
import 'package:flutter_stock_app/util/result.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeStockRepository implements StockRepository {
  FakeStockRepository(this._handler);

  final Future<Result<List<CompanyListing>>> Function(bool, String) _handler;
  bool? lastFetchFromRemote;
  String? lastQuery;

  @override
  Future<Result<List<CompanyListing>>> getCompanyListings(
    bool fetchFromRemote,
    String query,
  ) {
    lastFetchFromRemote = fetchFromRemote;
    lastQuery = query;
    return _handler(fetchFromRemote, query);
  }

  @override
  Future<Result<CompanyInfo>> getCompanyInfo(String symbol) {
    // TODO: implement getCompanyInfo
    throw UnimplementedError();
  }

  @override
  Future<Result<List<IntradayInfo>>> getIntradayInfo(String symbol) {
    // TODO: implement getIntradayInfo
    throw UnimplementedError();
  }
}

void main() {
  group('CompanyListingsNotifier', () {
    test('build: 초기 조회 시 캐시 파라미터(false, empty query)로 호출된다', () async {
      final expected = [
        const CompanyListing(symbol: 'AAPL', name: 'Apple', exchange: 'NASDAQ'),
      ];

      final fakeRepo = FakeStockRepository((_, _) async {
        return Result.success(expected);
      });

      final container = ProviderContainer(
        overrides: [repoProvider.overrideWithValue(fakeRepo)],
      );
      addTearDown(container.dispose);

      final result = await container.read(companyNotifierProvider.future);

      expect(result, expected);
      expect(fakeRepo.lastFetchFromRemote, false);
      expect(fakeRepo.lastQuery, '');
    });

    test('getCompanyListing: 성공 시 state가 AsyncData로 갱신된다', () async {
      final cached = [
        const CompanyListing(symbol: 'AAPL', name: 'Apple', exchange: 'NASDAQ'),
      ];
      final remote = [
        const CompanyListing(
          symbol: 'MSFT',
          name: 'Microsoft',
          exchange: 'NASDAQ',
        ),
      ];

      final fakeRepo = FakeStockRepository((fetchFromRemote, query) async {
        if (fetchFromRemote && query == 'MSFT') {
          return Result.success(remote);
        }
        return Result.success(cached);
      });

      final container = ProviderContainer(
        overrides: [repoProvider.overrideWithValue(fakeRepo)],
      );
      addTearDown(container.dispose);

      await container.read(companyNotifierProvider.future);
      await container
          .read(companyNotifierProvider.notifier)
          .getCompanyListing(fetchFromRemote: true, query: 'MSFT');

      final state = container.read(companyNotifierProvider);
      expect(state.hasValue, true);
      expect(state.value, remote);
      expect(fakeRepo.lastFetchFromRemote, true);
      expect(fakeRepo.lastQuery, 'MSFT');
    });

    test('getCompanyListing: 실패 시 state가 AsyncError가 된다', () async {
      final cached = [
        const CompanyListing(symbol: 'AAPL', name: 'Apple', exchange: 'NASDAQ'),
      ];

      final fakeRepo = FakeStockRepository((fetchFromRemote, query) async {
        if (query == 'ERROR') {
          return Result.error(Exception('network failed'));
        }
        return Result.success(cached);
      });

      final container = ProviderContainer(
        overrides: [repoProvider.overrideWithValue(fakeRepo)],
      );
      addTearDown(container.dispose);

      await container.read(companyNotifierProvider.future);
      await container
          .read(companyNotifierProvider.notifier)
          .getCompanyListing(query: 'ERROR');

      final state = container.read(companyNotifierProvider);
      expect(state.hasError, true);
      expect(state.error, isA<Exception>());
    });
  });
}
