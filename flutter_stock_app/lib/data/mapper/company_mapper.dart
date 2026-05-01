import 'package:flutter_stock_app/data/source/local/company_listing_entity.dart';
import 'package:flutter_stock_app/domain/model/company_listing.dart';

extension ToCompanyListing on CompanyListingEntity {
  CompanyListing toCompayListing() {
    return CompanyListing(symbol: symbol, name: name, exchange: exchange);
  }
}

extension ToCompanyEntity on CompanyListing {
  CompanyListingEntity toCompayListingEntity() {
    return CompanyListingEntity(symbol: symbol, name: name, exchange: exchange);
  }
}
