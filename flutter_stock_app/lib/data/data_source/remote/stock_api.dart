import 'package:dio/dio.dart';
import 'package:flutter_stock_app/data/data_source/remote/dto/company_info_dto.dart';

class StockApi {
  static const baseUrl = 'https://www.alphavantage.co';
  static const apiKey = 'R5A4PFIJTWSJW6Z8';
  final Dio _dio;

  StockApi({Dio? dio}) : _dio = dio ?? Dio();

  Future<Response> getListings({String apiKey = apiKey}) async {
    return await _dio.get(
      '$baseUrl/query?function=LISTING_STATUS&apikey=$apiKey',
    );
  }

  Future<CompanyInfoDto> getCompanyInfo({
    required String symbol,
    String apiKey = apiKey,
  }) async {
    final response = await _dio.get(
      '$baseUrl/query?function=OVERVIEW&symbol=$symbol&apikey=$apiKey',
    );
    return CompanyInfoDto.fromJson(response.data);
  }
}
