import 'package:flutter/material.dart';
import 'package:nike_shop/models/item.dart';

class Cart extends ChangeNotifier {
  List<Item> userCart = [];

  List<Item> getUserCart() {
    return userCart;
  }

  void addCart(Item item) {
    userCart.add(item);
    notifyListeners();
  }

  void removeCart(Item item) {
    userCart.remove(item);
    notifyListeners();
  }
}
