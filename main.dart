import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'productsProvider.dart';
import 'productList.dart';
import 'cartScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => ProductListScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
