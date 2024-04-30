import 'package:flutter/material.dart';
import 'package:flutter_state_management/layout/app_bar.dart';
import 'package:flutter_state_management/layout/layout.dart';

class LayoutWithAppBar extends StatelessWidget {
  const LayoutWithAppBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          const MyAppBar(),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
