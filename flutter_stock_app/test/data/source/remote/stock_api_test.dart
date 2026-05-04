import 'package:flutter_stock_app/data/data_source/csv/company_listing_parser.dart';
import 'package:flutter_stock_app/data/data_source/remote/stock_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('네트워크 통신', () async {
    final response = await StockApi().getListings();
    final parser = CompanyListingParser();
    final remoteListings = await parser.parse(response.data);

    expect(remoteListings[0].symbol, '-P-HIZ');
    expect(remoteListings[0].name, 'Presurance Holdings Inc');
    expect(remoteListings[0].exchange, 'NASDAQ');
  });
}
