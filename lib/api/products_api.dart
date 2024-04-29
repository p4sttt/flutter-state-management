import 'dart:math';

import 'package:flutter_state_management/model/product_item.dart';

class ProductsApi {
  final _products = List.generate(
    10, (index) => ProductItem(
      id: index.toString(),
      name: "Product $index",
      description: "This is description for product at index: $index",
      price: Random().nextInt(50).toDouble() + 10.0,
    ),
  );

  Future<List<ProductItem>> fetchProducts() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => _products,
    );
  }

  Future<ProductItem> fetchProductById(String id) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => _products.firstWhere((product) => product.id == id),
    );
  }
}