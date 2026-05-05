import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_app/data/data_source/local/company_listing_entity.dart';
import 'package:flutter_stock_app/presentation/company_listings/screen/company_listings_screen.dart';
import 'package:flutter_stock_app/util/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  Hive.initFlutter(); //hive init
  Hive.registerAdapter(CompanyListingEntityAdapter());

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: MaterialTheme.lightScheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: MaterialTheme.darkScheme(),
      ),
      themeMode: ThemeMode.system,
      home: const CompanyListingsScreen(),
    );
  }
}
