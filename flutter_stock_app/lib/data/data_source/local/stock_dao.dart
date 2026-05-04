import 'package:flutter_stock_app/data/data_source/local/company_listing_entity.dart';
import 'package:hive/hive.dart';

class StockDao {
  static const companyListing = 'companyListing'; //Hive 내부에 사용할 키

  //추가
  Future<void> insertCompanyListings(
    List<CompanyListingEntity> companyListingEntity,
  ) async {
    final box = await Hive.openBox('stock.db');
    await box.addAll(companyListingEntity);
  }

  //클리어
  Future<void> clearCompanyListing() async {
    final box = await Hive.openBox('stock.db');
    await box.clear();
  }

  //검색
  Future<List<CompanyListingEntity>> searchCompanyListing(String query) async {
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    final List<CompanyListingEntity> companyListing = box.values.toList();

    return companyListing
        .where(
          (e) =>
              e.name.toLowerCase().contains(query.toLowerCase()) ||
              query.toUpperCase() == e.symbol,
        )
        .toList();
  }
}
