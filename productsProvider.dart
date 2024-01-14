// lib/models/products_provider.dart

import 'package:flutter/material.dart';
import 'product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [
    Product(name: "Teddy Bear", image: "image/1.jpeg", price: 349.99),
    Product(name: "Sweater", image: "image/2.jpeg", price: 1099.99),
    Product(name: "Iphone 15", image: "image/3.jpeg", price: 82799.99),
    Product(name: "Electric Kettle 1.5L", image: "image/4.jpeg", price: 889.99),
    Product(name: "Dabur Honey 500mL", image: "image/5.jpeg", price: 299.99),
    Product(name: "Warm Comforter", image: "image/6.jpeg", price: 299.99),
    Product(name: "Vegetable Basket", image: "image/7.jpeg", price: 2199.99),
    Product(name: "HP Pavillion Laptop", image: "image/8.jpeg", price: 469.99),
    Product(name: "Roller Skates", image: "image/9.jpeg", price: 60899.99),
    Product(name: "Chocolates Set", image: "image/10.jpeg", price: 2469.99),
    Product(name: "Bottles Set", image: "image/11.jpeg", price: 499.99),
    Product(name: "Dress for Women", image: "image/12.jpeg", price: 549.99),
    Product(
        name: "Books for Leisure reading",
        image: "image/13.jpeg",
        price: 879.99),
    Product(
        name: "Apple Iphone Charger USB-C cable & adapter",
        image: "image/14.jpeg",
        price: 2499.99),
    Product(
        name: "Samsung OLED Television",
        image: "image/15.jpeg",
        price: 62899.99),
  ];

  List<Product> get products => _products;

  void addToCart(int index) {
    _products[index].isInCart = true;
    notifyListeners();
  }

  void removeFromCart(int index) {
    _products[index].isInCart = false;
    notifyListeners();
  }

  void showCheckAndMinusIcons(int index) {
    _products[index].isInCart = true;
    notifyListeners();
  }

  double calculateTotalPrice() {
    return _products.fold(0.0,
        (total, product) => total + (product.isInCart ? product.price : 0));
  }
}
