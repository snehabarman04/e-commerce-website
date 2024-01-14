// lib/screens/product_list_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'productsProvider.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, productsProvider, _) {
          return ListView.builder(
            itemCount: productsProvider.products.length,
            itemBuilder: (context, index) {
              var product = productsProvider.products[index];
              return ListTile(
                leading: Image.asset(
                  product.image,
                  width: 80,
                  height: 50,
                ),
                title: Text(product.name),
                subtitle: Text('\₹${product.price.toStringAsFixed(2)}'),
                trailing: product.isInCart
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.check),
                            onPressed: () {
                              productsProvider.addToCart(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              productsProvider.removeFromCart(index);
                            },
                          ),
                        ],
                      )
                    : IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          productsProvider.showCheckAndMinusIcons(index);
                        },
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
