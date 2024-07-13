import 'package:e_commerce_app/utils/all_products.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: const Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
              // Route route = MaterialPageRoute(
              //   builder: (context) => const Homepage(),
              // );

              // Navigator.of(context).pushAndRemoveUntil(
              //   route, (route) => false,
              // );
            }, 
            icon: Icon(
              Icons.home_rounded,
            ),
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: cartItem.isEmpty
          ? Center(
            child: Text("Cart is empty"),
          )
          : Column(
            children: 
              cartItem.map((e) => Container(
                child: Row(
                  children: [
                    Image.network(e['thumbnail']),
                    Text(e['price']),
                  ],
                ),
                )
              ).toList(),
          ),
      ),
    );
  }
}