import 'package:flutter/material.dart';
import 'package:nike_shop/models/item.dart';

class Cart extends ChangeNotifier {
  List<Item> userCart = [];

  List<Item> getUserCart() {
    return userCart;
  }

  void addCart(Item item) {
    item.count = 1;
    userCart.add(item);
    notifyListeners();
  }

  void removeCart(Item item) {
    userCart.remove(item);
    notifyListeners();
  }

  bool isExistInCart(Item item) {
    return userCart.contains(item);
  }

  void updateCount(Item item) {
    int count = item.count;
    count++;
    item.count = count;
    notifyListeners();
  }
}
