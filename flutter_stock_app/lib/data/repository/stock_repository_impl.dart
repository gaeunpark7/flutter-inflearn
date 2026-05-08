// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_stock_app/data/data_source/csv/company_listing_parser.dart';
import 'package:flutter_stock_app/data/data_source/csv/intraday_info_parser.dart';
import 'package:flutter_stock_app/data/data_source/local/stock_dao.dart';
import 'package:flutter_stock_app/data/data_source/remote/stock_api.dart';
import 'package:flutter_stock_app/data/mapper/company_mapper.dart';
import 'package:flutter_stock_app/domain/model/company_info.dart';
import 'package:flutter_stock_app/domain/model/company_listing.dart';
import 'package:flutter_stock_app/domain/model/intraday_info.dart';
import 'package:flutter_stock_app/domain/repository/stock_repository.dart';
import 'package:flutter_stock_app/util/result.dart';

class StockRepositoryImpl implements StockRepository {
  final StockApi _api;
  final StockDao _dao;
  final _companyListingsParser = CompanyListingParser();
  final _intradayInfoParser = IntradayInfoParser();

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
        localListings.map((e) => e.toCompanyListing()).toList(),
      );
    }
    // 리모트
    try {
      final response = await _api.getListings();
      final remoteListings = await _companyListingsParser.parse(response.data);

      //캐시 비우기
      await _dao.clearCompanyListing();

      // 캐시 추가
      await _dao.insertCompanyListings(
        remoteListings.map((e) => e.toCompanyListingEntity()).toList(),
      );

      return Result.success(remoteListings);
    } catch (e) {
      return Result.error(Exception('데이터 로드 실패: $e'));
    }
  }

  @override
  Future<Result<CompanyInfo>> getCompanyInfo(String symbol) async {
    try {
      final dto = await _api.getCompanyInfo(symbol: symbol);
      return Result.success(dto.toCompanyInfo());
    } catch (e) {
      return Result.error(Exception('회사 정보 로드 실패: ${e.toString()}'));
    }
  }

  @override
  Future<Result<List<IntradayInfo>>> getIntradayInfo(String symbol) async {
    try {
      final response = await _api.getIntradayInfo(symbol: symbol);
      final result = await _intradayInfoParser.parse(response.data);
      return Result.success(result);
    } catch (e) {
      return Result.error(Exception('intraay 정보 로드 실패!: ${e.toString}'));
    }
  }
}
