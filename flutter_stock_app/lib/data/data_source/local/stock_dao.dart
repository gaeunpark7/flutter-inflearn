import 'package:flutter_stock_app/data/data_source/local/company_listing_entity.dart';
import 'package:hive/hive.dart';

class StockDao {
  static const companyListing = 'companyListing'; //Hive 내부에 사용할 키
  final box = Hive.box('stock.db');

  //추가
  Future<void> insertCompanyListings(
    List<CompanyListingEntity> companyListingEntity,
  ) async {
    await box.put(StockDao.companyListing, companyListingEntity);
  }

  //클리어
  Future<void> clearCompanyListing() async {
    await box.clear();
  }

  //검색
  Future<List<CompanyListingEntity>> searchCompanyListing(String query) async {
    final List<CompanyListingEntity> companyListing = await box.get(
      StockDao.companyListing,
      defaultValue: <CompanyListingEntity>[],
    );
    return companyListing
        .where(
          (e) =>
              e.name.toLowerCase().contains(query.toLowerCase()) ||
              query.toUpperCase() == e.symbol,
        )
        .toList();
  }
}
