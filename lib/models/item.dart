class Item {
  final String imgPath;
  final String imgInfo;
  final String shoeName;
  final String shoePrice;
  int count;

  Item(
      {required this.imgPath,
      required this.imgInfo,
      required this.shoeName,
      required this.shoePrice,
      this.count = 0});
}

List<Item> items = [
  Item(
    imgPath: "assets/images/nike_1.png",
    imgInfo: "The forward-thinking design of his latest signature shoe.",
    shoeName: "Zoom FREAK",
    shoePrice: "\$236",
    count: 0,
  ),
  Item(
    imgPath: "assets/images/nike_2.png",
    imgInfo:
        "You've got the hops and the speed-lace up in shoes that enhance what you bring to the court.",
    shoeName: "Air Jordans",
    shoePrice: "\$220",
    count: 0,
  ),
  Item(
    imgPath: "assets/images/nike_3.png",
    imgInfo:
        "A secure midfoot strap is suited for scoring binges and defensive stands, so that you can lock in and keep winning.",
    shoeName: "KD Treys",
    shoePrice: "\$240",
    count: 0,
  ),
  Item(
    imgPath: "assets/images/nike_4.png",
    imgInfo: "The forward-thinking design of his latest signature shoe.",
    shoeName: "Kyrie 6",
    shoePrice: "\$190",
    count: 0,
  ),
];
