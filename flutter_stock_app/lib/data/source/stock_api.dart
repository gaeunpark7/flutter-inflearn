import 'package:dio/dio.dart';

class StockApi {
  static const baseUrl = 'https://www.alphavantage.co/';
  static const apiKey = 'R5A4PFIJTWSJW6Z8';
  final Dio _dio;

  StockApi({Dio? dio}) : _dio = dio ?? Dio();

  Future<Response> getListings(String apiKey) async {
    return await _dio.get(
      'https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=$apiKey',
    );
  }
}
