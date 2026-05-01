// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_stock_app/data/data_source/local/stock_dao.dart';
import 'package:flutter_stock_app/data/data_source/remote/stock_api.dart';
import 'package:flutter_stock_app/data/mapper/company_mapper.dart';
import 'package:flutter_stock_app/domain/model/company_listing.dart';
import 'package:flutter_stock_app/domain/repository/stock_repository.dart';
import 'package:flutter_stock_app/util/result.dart';

class StockRepositoryImpl implements StockRepository {
  final StockApi _api;
  final StockDao _dao;

  StockRepositoryImpl(this._api, this._dao);

  @override
  Future<Result<List<CompanyListing>>> getCompanyListings(
    bool fetchFromRemote,
    String query,
  ) async {
    //캐시에서 찾음
    final localListings = await _dao.searchCompanyListing(query);

    //없다면 remote에서 가져옴.
    final isDbEmpty = localListings.isEmpty && query.isEmpty;
    final shouldJustLoadFromCache = !isDbEmpty && !fetchFromRemote;

    if (shouldJustLoadFromCache) {
      return Result.success(
        localListings.map((e) => e.toCompayListing()).toList(),
      );
    }
    try {
      final remoteListings = await _api.getListings();
      return Result.success([]); //remoteListings CSV 파싱 변환
    } catch (e) {
      return Result.error(Exception('데이터 로드 실패: $e'));
    }
  }
}
