import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_app/presentation/company_listings/screen/company_info_screen.dart';
import 'package:flutter_stock_app/presentation/company_listings/widget/company_text_field.dart';
import 'package:flutter_stock_app/presentation/provider/company_listings_notifier.dart';

class CompanyListingsScreen extends ConsumerStatefulWidget {
  const CompanyListingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CompanyListingsScreenState();
}

class _CompanyListingsScreenState extends ConsumerState<CompanyListingsScreen> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  void _onsearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(companyNotifierProvider.notifier).searchListing(value);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final companyListingsAsync = ref.watch(companyNotifierProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CompanyTextField(
                controller: _searchController,
                onChanged: (value) => _onsearchChanged(value),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref
                      .read(companyNotifierProvider.notifier)
                      .getCompanyListing(fetchFromRemote: true);
                },
                child: switch (companyListingsAsync) {
                  AsyncData(:final value) => ListView.separated(
                    itemCount: value.length,
                    itemBuilder: (ctx, index) {
                      final company = value[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) =>
                                  CompanyInfoScreen(symbol: company.symbol),
                            ),
                          );
                        },
                        title: Text(
                          company.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) =>
                        Divider(color: Theme.of(ctx).colorScheme.secondary),
                  ),
                  AsyncError(:final error) => Center(child: Text('$error')),
                  (_) => Center(),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
