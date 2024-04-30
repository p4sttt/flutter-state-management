import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/model/product_item.dart';

class CartModel extends ChangeNotifier {
  final List<ProductItem> _items = [];

  UnmodifiableListView<ProductItem> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(0.0, (sum, item) => sum + item.price);

  int get itemsCount => _items.length;

  void add(ProductItem item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(ProductItem item) {
    _items.remove(item);
    notifyListeners();
  }
}
