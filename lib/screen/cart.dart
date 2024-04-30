import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/model/cart.dart';
import 'package:flutter_state_management/routes.dart';
import 'package:flutter_state_management/widget/product_card.dart';
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

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              "Cart",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ProductCard(
                  id: cart.items.elementAt(index).id,
                  name: cart.items.elementAt(index).name,
                  description: cart.items.elementAt(index).description,
                  price: cart.items.elementAt(index).price,
                ),
                itemCount: cart.items.length,
              ),
            ),
            const Expanded(child: SizedBox.expand()),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black54,
                    width: 1.5,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total price",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${cart.totalPrice.toStringAsFixed(2)}\$",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
