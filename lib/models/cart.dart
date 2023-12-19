import 'package:flutter/material.dart';
import 'package:nike_shop/models/item.dart';

class Cart extends ChangeNotifier {
  List<Item> userCart = [];

  List<Item> getUserCart() {
    return userCart;
  }

  void addCart(Item item, int count) {
    if (item.count == 0) {
      item.count = count;
    }
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

  void updateCountNum(Item item, int count) {
    if (item.count == 0) {
      if (count >= 1) {
        addCart(item, count);
      }
    } else {
      item.count += count;
    }
    notifyListeners();
  }
}
