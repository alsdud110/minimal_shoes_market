import 'package:flutter/material.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/models/item.dart';
import 'package:provider/provider.dart';

class UserCartTile extends StatelessWidget {
  final Item item;
  const UserCartTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // img
          Image(
            image: AssetImage(item.imgPath),
            height: 90,
            width: 60,
          ),
          // shoe name and price
          const SizedBox(
            width: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.shoeName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                item.count > 1
                    ? Text(
                        "${item.count}개 ${item.shoePrice}",
                        style: TextStyle(color: Colors.grey[500], fontSize: 11),
                      )
                    : Text(
                        item.shoePrice,
                        style: TextStyle(color: Colors.grey[500], fontSize: 12),
                      ),
              ],
            ),
          ),
          const Spacer(),
          // delete icon
          IconButton(
              icon: const Icon(Icons.delete_forever_outlined),
              onPressed: () {
                Provider.of<Cart>(context, listen: false).removeCart(item);
              }),
        ],
      ),
    );
  }
}
