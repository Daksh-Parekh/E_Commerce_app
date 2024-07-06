import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  //Map<String,dynamic> product;
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> product = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    Size size = MediaQuery.sizeOf(context);
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
        title: const Text("Detail Page"), 
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed('cart_page');
            // Route route = MaterialPageRoute(builder: (context) => CartPage());

            // Navigator.of(context).push(route);
          },
            icon: Icon(
              Icons.shopping_cart_rounded
            ),
          ),
          
        ],  
      ),
      body: Center(
        child: Column(          
          children: [
            SizedBox(height: size.height *0.04),
            SizedBox(
              height: size.height *0.1,
              child: Text(
                product['title'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Image(
              image: NetworkImage(product['thumbnail']),
            ),
            SizedBox(height: size.height*0.04),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\$${product['price']}",
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04,),
            Text(
              product['description'],  
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_shopping_cart_rounded,
        ), 
      ),
    );
  }
}