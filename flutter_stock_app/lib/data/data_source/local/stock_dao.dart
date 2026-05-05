import 'package:flutter_stock_app/data/data_source/local/company_listing_entity.dart';
import 'package:hive/hive.dart';

class StockDao {
  static const companyListing = 'companyListing'; //Hive 내부에 사용할 키

  Future<Box<CompanyListingEntity>> _openBox() async {
    if (Hive.isBoxOpen('stock.db')) {
      return Hive.box<CompanyListingEntity>('stock.db');
    }
    return await Hive.openBox<CompanyListingEntity>('stock.db');
  }

  //추가
  Future<void> insertCompanyListings(
    List<CompanyListingEntity> companyListingEntity,
  ) async {
    final box = await _openBox();
    await box.clear();
    await box.addAll(companyListingEntity);
  }

  //클리어
  Future<void> clearCompanyListing() async {
    final box = await _openBox();
    await box.clear();
  }

  //검색
  Future<List<CompanyListingEntity>> searchCompanyListing(String query) async {
    final box = await _openBox();
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
