import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_management/model/cart.dart';
import 'package:flutter_state_management/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter State Management",
        onGenerateRoute: AppRouter.generateRoutes,
      ),
    );
  }
}
