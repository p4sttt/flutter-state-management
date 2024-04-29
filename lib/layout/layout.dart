import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
  });

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: child,
      ),
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
