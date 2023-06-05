import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:cishop/data/dummy_data.dart';
import 'package:http/http.dart' as http;

import 'product.dart';

class ProductList with ChangeNotifier {
  final _baseUrl = 'https://cishop-65cba-default-rtdb.firebaseio.com';
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    return _items.length;
  }

  Future<void> _addProduct(Product product) {
    final future = http.post(
      Uri.parse('$_baseUrl/products.json'),
      body: jsonEncode(
        {
          "name": product.name,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
          "isFavorite": product.isFavorite,
        },
      ),
    );

    return future.then<void>(
      (response) {
        final id = jsonDecode(response.body)['name'];

        _items.add(
          Product(
            id: id,
            name: product.name,
            description: product.description,
            price: product.price,
            imageUrl: product.imageUrl,
            isFavorite: product.isFavorite,
          ),
        );
        notifyListeners();
      },
    );
  }

  Future<void> saveProduct(Map<String, Object> data) {
    final hasId = data['id'] != null;

    final newProduct = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    if (hasId) {
      return _updateProduct(newProduct);
    } else {
      return _addProduct(newProduct);
    }
  }

  Future<void> _updateProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }

    return Future.value();
  }

  void removeProduct(Product product) {
    _items.removeWhere((p) => p.id == product.id);
    notifyListeners();
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
