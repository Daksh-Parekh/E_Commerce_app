import 'package:e_commerce_app/utils/all_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List fruits = [
  //   "Apple",
  //   "Banana",
  //   "Orange",
  //   "Mango",
  //   "Pineapple",
  //   "Grapes",
  //   "Watermelon",
  //   "Strawberry",
  //   "Lemon",
  //   "Peach",
  // ];

  List CategoryImg = [
    "https://www.picmaker.com/templates/_next/image?url=https%3A%2F%2Fstatic.picmaker.com%2Fscene-prebuilts%2Fthumbnails%2FYT-0103.png&w=1920&q=75",
    "https://c1.wallpaperflare.com/preview/327/906/571/perfume-smell-glass-bottles-aroma-fragrant-fragrance-thumbnail.jpg",
    "https://hatil.com/blog/wp-content/uploads/2022/09/Hatil-Thematic-Facebook-Thumbnail.png",

  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Home Page",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        actions: const [
          Icon(Icons.camera_alt_rounded),
          SizedBox(width: 20),
          Icon(Icons.search),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(          
            children: [
              SizedBox(
                height: size.height * 0.4,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: allProducts.map((e) => GestureDetector(
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
                            const SizedBox(
                              height: 20,
                            ),
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
              SizedBox(height: size.height*0.08,),
              SizedBox(
                height: size.height * 0.06,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Expanded(
                    child: Text(
                      "Category",
                    ),
                  ),
                ),
              ),
              
              
              //ChildAvtar for category..
               SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: Row(
                   children: allCategories
                    .map(
                      (e)=> SizedBox(
                        width: size.width * 0.2,
                        child: Column(
                          children: [
                            CircleAvatar(
                             // foregroundImage: NetworkImage("https://www.picmaker.com/templates/_next/image?url=https%3A%2F%2Fstatic.picmaker.com%2Fscene-prebuilts%2Fthumbnails%2FYT-0103.png&w=1920&q=75",),
                              radius: 30,
                            ),
                            Text(e,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ).toList(),
                 ),
               ),
               //Bottom Image
            //   SizedBox(
            //     height: size.height * 0.4,
            //     child: Container(
            //       height: 80,
            //       //child: Image.asset('lib/assets/images/dubai.jpg'),
          
            //       color: Colors.green,
            //       child: const Image(
            //         image: AssetImage('lib/assets/images/dubai.jpg'),
            //         fit: BoxFit.cover,
            //       ),
            //       //child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Dubai_Skylines_at_night_%28Pexels_3787839%29.jpg/640px-Dubai_Skylines_at_night_%28Pexels_3787839%29.jpg'),
            //       //color: Colors.green,
            //       //child: Image(image: AssetImage('lib/assets/images/img.jpeg')),
            //       //child: Image.asset('lib/assets/images/dubai.jpg'),
            //     ),
            //   ),
            ],
          ),
        ),
      ),
    );
  }
}