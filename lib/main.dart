import 'package:cishop/models/order_list.dart';
import 'package:cishop/models/product_list.dart';
import 'package:cishop/pages/auth_page.dart';
import 'package:cishop/pages/cart_page.dart';
import 'package:cishop/pages/orders_page.dart';
import 'package:cishop/pages/product_detail_page.dart';
import 'package:cishop/pages/product_form_page.dart';
import 'package:cishop/pages/products_overview_page.dart';
import 'package:cishop/pages/products_page.dart';
import 'package:cishop/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'models/auth.dart';
import 'models/cart.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrange),
          fontFamily: 'Lato',
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.AUTH: (ctx) => const AuthPage(),
          AppRoutes.HOME: (ctx) => const ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
          AppRoutes.CART: (ctx) => const CartPage(),
          AppRoutes.ORDERS: (ctx) => const OrdersPage(),
          AppRoutes.PRODUCTS: (ctx) => const ProductsPage(),
          AppRoutes.PRODUCT_FORM: (ctx) => const ProductFormPage(),
        },
      ),
    );
  }
}
