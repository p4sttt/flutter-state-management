import 'package:flutter/material.dart';
import 'package:flutter_state_management/api/products_api.dart';
import 'package:flutter_state_management/model/product_item.dart';
import 'package:flutter_state_management/routes.dart';
import 'package:flutter_state_management/widget/product_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  static const route = AppRouter.products;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final productsApi = ProductsApi();
  late Future<List<ProductItem>> _products;

  @override
  void initState() {
    super.initState();
    _products = productsApi.fetchProducts();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _products = productsApi.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          "All products",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        FutureBuilder(
          future: _products,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final products = snapshot.data!;

              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ProductCard(
                    id: products.elementAt(index).id,
                    name: products.elementAt(index).name,
                    description: products.elementAt(index).description,
                    price: products.elementAt(index).price,
                  ),
                  itemCount: products.length,
                ),
              );
            } else if (snapshot.hasData && snapshot.data == null) {
              return const Center(
                child: Text("No products found"),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }

            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
