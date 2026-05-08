import 'package:flutter_stock_app/data/data_source/remote/dto/intraday_info_dto.dart';
import 'package:flutter_stock_app/domain/model/intraday_info.dart';
import 'package:intl/intl.dart';

extension ToIntradayInfo on IntradayInfoDto {
  IntradayInfo toIntradayInfo() {
    //2026-05-01 19:15:00
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return IntradayInfo(date: formatter.parse(timestamp), close: close);
  }
}
