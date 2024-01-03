import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nike_shop/components/bottom_nav_bar.dart';
import 'package:nike_shop/light_theme.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/screens/cart_page.dart';
import 'package:nike_shop/screens/shop_page.dart';
import 'package:nike_shop/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.put(Cart());
    // TODO: implement initState
    super.initState();
  }

  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [const ShopPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // Appbar에서 drawer를 키는 방법, 암기!!!
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context).themeData == lightTheme
                  ? false
                  : true,
              activeColor: CupertinoColors.black,
              thumbColor: Theme.of(context).colorScheme.primary,
              onChanged: (bool? value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
                  child: Image(
                    image: AssetImage("assets/images/nike_logo.png"),
                    fit: BoxFit.cover,
                    color: Colors.white,
                    width: 180,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.0),
                  child: ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: Icon(
                      Icons.info_rounded,
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25),
              child: ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: Icon(
                  Icons.output_outlined,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index!),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
