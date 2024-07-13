import 'package:e_commerce_app/utils/all_products.dart';
import 'package:e_commerce_app/views/extensions.dart';
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Colors.grey,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                height: 200,
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(e['thumbnail']),
                    Text(
                      "${e['price']}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        cartItem.remove(e);
                        setState(() {});
                      } , 
                      icon: (Icon(Icons.delete_forever_rounded)),
                    ),

                  15.ofHeight,
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                e['qty']--;
                                setState(() {});
                              }, 
                              icon: (Icon(Icons.remove)),
                            ),
                        Text("${e['qty']}"),
                        IconButton(
                          onPressed: () {
                            e['qty']++;
                            setState(() {});
                          }, 
                          icon: (Icon(Icons.add)),
                        ),
                        ],
                      ),
                    ],
                  ),
                
                  ],
                ),
                    
                  
                
              ),
            ).toList(),
          ),
      ),
    );
  }
}