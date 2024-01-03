import 'package:flutter/material.dart';
import 'package:nike_shop/dart_theme.dart';
import 'package:nike_shop/models/cart.dart';
import 'package:nike_shop/screens/intro_screen.dart';
import 'package:nike_shop/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        theme: Provider.of<ThemeProvider>(context).themeData,
        debugShowCheckedModeBanner: false,
        home: const IntroScreen(),
      ),
    );
  }
}
