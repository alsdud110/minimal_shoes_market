import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_shop/components/user_cart_tile.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget with CartProvier {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 16,
          ),

          // cart container
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: searchCart.userCart.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: UserCartTile(
                    item: searchCart.userCart[index],
                  ),
                ),
              ),
            ),
          ),

          Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black87,
            ),
            padding: const EdgeInsets.all(25),
            child: const Center(
              child: Text(
                "\$PAY",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
