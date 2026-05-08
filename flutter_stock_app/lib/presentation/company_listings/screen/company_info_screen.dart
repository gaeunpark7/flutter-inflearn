import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_app/presentation/company_listings/widget/stock_chart.dart';
import 'package:flutter_stock_app/presentation/provider/company_info_notifier.dart';

class CompanyInfoScreen extends ConsumerStatefulWidget {
  final String symbol;
  const CompanyInfoScreen({super.key, required this.symbol});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends ConsumerState<CompanyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final infoAsync = ref.watch(companyInfoProvider(widget.symbol));
    final intradayAsync = ref.watch(intradayInfoProvider(widget.symbol));
    var circularProgressIndicator = CircularProgressIndicator();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: switch (infoAsync) {
            AsyncData(:final value) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  value.symbol,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                Divider(height: 1),
                Text(
                  'Industry: ${value.industry}',
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Country: ${value.country}',
                  style: TextStyle(color: Colors.white),
                ),
                Divider(),
                Text(
                  value.description,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  '주가 그래프',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                switch (intradayAsync) {
                  AsyncData(:final value) => StockChart(infos: value),
                  AsyncError(:final error) => Center(
                    child: Text(
                      'e:$error',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  (_) => circularProgressIndicator,
                },
              ],
            ),
            AsyncError(:final error) => Center(child: Text('$error')),
            _ => Center(child: CircularProgressIndicator()),
          },
        ),
      ),
    );
  }
}
