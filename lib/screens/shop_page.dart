import 'package:flutter/material.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/models/item.dart';
import 'package:nike_shop/screens/cart_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({
    super.key,
  });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<int> selectedCount = [0, 0, 0, 0];

  void addCount(int index) {
    setState(() {
      selectedCount[index]++;
    });
  }

  minusCount(int index) {
    if (selectedCount[index] > 0) {
      setState(() {
        selectedCount[index]--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 55,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: Colors.grey[500],
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Text(
                "everyone flies.. some fly longer than others",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 22, right: 22, bottom: 16, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hot Picks 🔥",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 410,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 25),
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: SizedBox(
                            height: 160,
                            width: 150,
                            child: Image(
                              image: AssetImage(items[index].imgPath),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            items[index].imgInfo,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].shoeName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              items[index].shoePrice,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => minusCount(index),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration:
                                    BoxDecoration(color: Colors.grey[500]),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => addCount(index),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration:
                                    BoxDecoration(color: Colors.grey[500]),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: 30,
                              height: 30,
                              child: Center(
                                child: Text("${selectedCount[index]}"),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    // 장바구니에 해당 아이템이 존재하는 지 확인
                                    bool isExist = Provider.of<Cart>(context,
                                            listen: false)
                                        .isExistInCart(items[index]);

                                    // 선택한 개수 불러오기
                                    int count = selectedCount[index];

                                    if (count == 0) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          backgroundColor:
                                              Colors.black.withOpacity(0.6),
                                          title: const Text(
                                            "Please Select Counts",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );

                                      return;
                                    }

                                    Provider.of<Cart>(context, listen: false)
                                        .updateCountNum(items[index], count);

                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor:
                                            Colors.black.withOpacity(0.6),
                                        title: Text(
                                          !isExist
                                              ? "Successfully added!"
                                              : "Already In The Cart",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        content: const Text(
                                          "Check your cart",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    );
                                    setState(() {
                                      selectedCount[index] = 0;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: 4,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Divider(
            color: Colors.white,
            thickness: 2.0,
            indent: 25,
            endIndent: 25,
          ),
        ],
      ),
    );
  }
}
