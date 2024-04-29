import 'package:flutter/material.dart';
import 'package:flutter_state_management/screen/home.dart';
import 'package:flutter_state_management/screen/single_product.dart';

class AppRouter {
  static const String home = '/';
  static const String products = '/products';
  static const String singleProduct = '/products/product';
  static const String cart = '/cart';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Home(),
        );
      case singleProduct:
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductScreen(settings.arguments as ProductScreenArguments),
        );

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => const Home(),
        );
    }
  }
}
