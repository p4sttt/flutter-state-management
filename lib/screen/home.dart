import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/routes.dart';
import 'package:flutter_state_management/screen/all_products.dart';
import 'package:flutter_state_management/screen/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const route = AppRouter.home;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _screensOptions = [
    const ProductsScreen(),
    const CartScreen(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.homeOutline),
            label: 'All products',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.shoppingCartOutline),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) => setState(() {
          _selectedIndex = index;
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: _screensOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
