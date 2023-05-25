import 'package:cishop/pages/product_detail_page.dart';
import 'package:cishop/pages/products_overview_page.dart';
import 'package:cishop/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.deepOrange),
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
      },
    );
  }
}
