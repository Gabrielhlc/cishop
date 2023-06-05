import 'dart:math';

import 'package:cishop/data/dummy_data.dart';
import 'package:flutter/material.dart';

import 'product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    return _items.length;
  }

  void _addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void saveProduct(Map<String, Object> data) {
    final newProduct = Product(
      id: Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );
    _addProduct(newProduct);
  }
}

// Global Way
// bool _showFavoriteOnly = false;

//   List<Product> get items {
//     if (_showFavoriteOnly) {
//       return _items.where((item) => item.isFavorite).toList();
//     }
//     return [..._items];
//   }

//   void showFavoriteOnly() {
//     _showFavoriteOnly = true;
//     notifyListeners();
//   }

//   void showAll() {
//     _showFavoriteOnly = false;
//     notifyListeners();
//   }
