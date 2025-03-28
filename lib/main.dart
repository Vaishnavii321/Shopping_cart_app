import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/cart_screen.dart';
import 'screens/catalog_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      routes: {
        '/': (context) => CatalogScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
