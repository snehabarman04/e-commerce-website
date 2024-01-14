// lib/screens/cart_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'productsProvider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, productsProvider, _) {
          return ListView.builder(
            itemCount: productsProvider.products.length,
            itemBuilder: (context, index) {
              var product = productsProvider.products[index];
              if (product.isInCart) {
                return ListTile(
                  leading: Image.asset(
                    product.image,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(product.name),
                  subtitle: Text('\₹${product.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          productsProvider.removeFromCart(index);
                        },
                      )
                    ],
                  ),
                );
              } else {
                return SizedBox
                    .shrink(); // Hide products that are not in the cart
              }
            },
          );
        },
      ),
      bottomNavigationBar: Consumer<ProductsProvider>(
        builder: (context, productsProvider, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Total: \₹${productsProvider.calculateTotalPrice().toStringAsFixed(2)}'),
                ElevatedButton(
                  onPressed: () {
                    productsProvider.products.forEach((product) {
                      product.isInCart = false;
                    });
                    productsProvider.notifyListeners();
                    Navigator.pop(
                        context); // Go back to the product list screen
                  },
                  child: Text('BUY'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
