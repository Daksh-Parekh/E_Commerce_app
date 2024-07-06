import 'package:e_commerce_app/views/cart_page.dart';
import 'package:e_commerce_app/views/detail_page.dart';
import 'package:e_commerce_app/views/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Homepage(),
      // initialRoute: 'home_page',
      routes: {
        '/' : (context) => const Homepage(),
        'detail_page' : (context) => const DetailPage(),
        'cart_page' : (context) => const CartPage(),
      },
    );
  }
}


//https://dummyjson.com/products?limit=10000