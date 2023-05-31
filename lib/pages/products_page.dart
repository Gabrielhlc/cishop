import 'package:cishop/components/app_drawer.dart';
import 'package:cishop/components/product_item.dart';
import 'package:cishop/models/product_list.dart';
import 'package:cishop/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Produtos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.itemsCount,
          itemBuilder: (ctx, index) => Column(
            children: <Widget>[
              ProductItem(products.items[index]),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
