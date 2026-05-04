import 'package:flutter_stock_app/data/data_source/csv/csv_parser.dart';
import 'package:csv/csv.dart';
import 'package:flutter_stock_app/domain/model/company_listing.dart';

class CompanyListingParser implements CsvParser<CompanyListing> {
  @override
  Future<List<CompanyListing>> parse(String csvString) async {
    List<List<dynamic>> csvValues = csv.decode(csvString);

    csvValues.removeAt(0); //symbol, name, excahnge 지우고 행만남김
    return csvValues
        .map((e) {
          final symbol = e[0] ?? '';
          final name = e[1] ?? '';
          final exchange = e[2] ?? '';
          return CompanyListing(symbol: symbol, name: name, exchange: exchange);
        })
        .where(
          (e) =>
              e.symbol.isNotEmpty && e.name.isNotEmpty && e.exchange.isNotEmpty,
        )
        .toList();
  }
}
