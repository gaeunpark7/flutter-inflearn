import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_app/di/provider_setup.dart';
import 'package:flutter_stock_app/domain/model/company_info.dart';

final companyInfoProvider =
    AsyncNotifierProviderFamily<CompanyInfoNotifier, CompanyInfo, String>(
      CompanyInfoNotifier.new,
    );

class CompanyInfoNotifier extends FamilyAsyncNotifier<CompanyInfo, String> {
  @override
  FutureOr<CompanyInfo> build(String symbol) async {
    final repo = ref.read(repoProvider);
    final result = await repo.getCompanyInfo(symbol);
    return result.when(success: (data) => data, error: (e) => throw e);
  }
}

  //불러오기
  // Future<void> getCompanyIfo(String symbol) async {
  //   state = const AsyncLoading();
  //   final repo = ref.read(repoProvider);
  //   final result = await repo.getCompanyInfo(symbol);

  //   state = result.when(
  //     success: (data) => AsyncData(data),
  //     error: (e) => AsyncError(e, StackTrace.current),
  //   );
  // }

