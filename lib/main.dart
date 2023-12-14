import 'package:flutter/material.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/screens/intro_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
        debugShowCheckedModeBanner: false,
        home: const IntroScreen(),
      ),
    );
  }
}
