import 'package:flutter/material.dart';
import 'package:nike_shop/screens/home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.only(top: 200, bottom: 140),
            child: Image(
              image: const AssetImage("assets/images/nike_logo.png"),
              fit: BoxFit.cover,
              color: Colors.grey[800],
              width: 300,
              height: 150,
            ),
          ),
          // title
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Just Do It",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
          // subtitle
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0, left: 30, right: 30),
            child: Text(
              "Brand new sneakers and custom kicks made with premium quality",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // start now button
          GestureDetector(
            onTap: () {
              // 페이지 이동 필수!!! 암기
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: Container(
              height: 70,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[850]),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Center(
                  child: Text(
                    "Shop Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
