import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/model/cart.dart';
import 'package:flutter_state_management/routes.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const route = AppRouter.cart;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        for (var product in cart.items) {
          log("${product.name} - ${product.price}");
        }
        return Center(
          child: Text("total price: ${cart.totalPrice}"),
        );
      },
    );
  }
}
