import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_shop/models/item.dart';

abstract mixin class CartProvier {
  late final searchCart = Get.find<Cart>();
}

class Cart extends GetxController {
  RxList<Item> userCart = <Item>[].obs;

  RxList<Item> getUserCart() {
    return userCart;
  }

  void addCart(Item item, int count) {
    if (item.count == 0) {
      item.count = count;
    }
    userCart.add(item);
  }

  void removeCart(Item item) {
    userCart.remove(item);
  }

  bool isExistInCart(Item item) {
    return userCart.contains(item);
  }

  void updateCount(Item item) {
    int count = item.count;
    count++;
    item.count = count;
  }

  void updateCountNum(Item item, int count) {
    if (item.count == 0) {
      if (count >= 1) {
        addCart(item, count);
      }
    } else {
      item.count += count;
    }
  }
}
