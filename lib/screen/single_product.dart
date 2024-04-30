import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/api/products_api.dart';
import 'package:flutter_state_management/layout/layout_with_app_bar.dart';
import 'package:flutter_state_management/model/cart.dart';
import 'package:flutter_state_management/model/product_item.dart';
import 'package:flutter_state_management/routes.dart';
import 'package:provider/provider.dart';

class ProductScreenArguments {
  ProductScreenArguments(this.id);

  final String id;
}

class ProductScreen extends StatefulWidget {
  const ProductScreen(this.args, {super.key});

  static const route = AppRouter.singleProduct;
  final ProductScreenArguments args;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productsApi = ProductsApi();
  late Future<ProductItem> _product;

  @override
  void initState() {
    super.initState();
    _product = productsApi.fetchProductById(widget.args.id);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _product = productsApi.fetchProductById(widget.args.id);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWithAppBar(
      child: FutureBuilder(
        future: _product,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final product = snapshot.data!;

            return Consumer<CartModel>(
              builder: (context, cart, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                        product.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        color: const Color(0xffc9c9c9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const Expanded(child: SizedBox.expand()),
                    InkWell(
                      onTap: () {
                        cart.add(snapshot.data!);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: const Alignment(0.0, 0.0),
                        child: Text(
                          "Buy for ${product.price.toStringAsFixed(2)}\$",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
            );
          } else if (snapshot.hasData && snapshot.data == null) {
            return const Center(child: Text("Product not found"));
          } else if (snapshot.hasError) {
            log(snapshot.error.toString());
            return const Center(child: Text("Ethernet error"));
          }

          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
