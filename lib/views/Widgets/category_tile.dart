import 'package:e_commerce_app/utils/all_products.dart';
import 'package:e_commerce_app/views/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


Widget CategoryTile({
  required Size size, 
  required BuildContext context, 
  String category = "All"}) {
  
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        height: size.height * 0.4,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: allProducts.where(
              (element) => category == "All"
                ? true
                :category == element['category'],
              
            ).map((e) => GestureDetector(
              onTap: () {
                        Navigator.of(context).pushNamed(
                          'detail_page',
                          arguments: e,
                        );
                        //DEFAULT ROUTES
                        // Route route = MaterialPageRoute(
                        //   builder: (context) => DetailPage(product: e,),
                        // );

                        // Navigator.of(context).push(
                        //   route,
                        // );
                      },
                      child: Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(right: 10,bottom: 10),
                        padding: const EdgeInsets.all(15),
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                          color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(5, 6),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: NetworkImage(e['thumbnail']),
                            ),
                            Text(e['title']),
                            20.ofHeight,
                            Text("\$${e['price']}"),
                            // Image.network(e['thumbnail'],),
                            const Spacer(),
                            RatingBar.builder(
                              initialRating: e['rating'],
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 20,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    ).toList(),
                  
             
                  ),
                 
                  // child: Row(
                  //   children: fruits.map((e) => Container(
                  //     padding: EdgeInsets.all(10),
                  //     margin: EdgeInsets.all(10),
                  //     decoration: BoxDecoration(
                  //       color: Colors.primaries[fruits.indexOf(e)],
                  //     ),
                  //     child: Text(e),
                  //   ),
                  //   ).toList(),
                  // ),
                  // color: Colors.red,
                ),
              ),
    ],
  );
}