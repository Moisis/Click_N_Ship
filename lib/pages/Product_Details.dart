
import 'package:carousel_slider/carousel_slider.dart';
import 'package:click_n_ship/models/Cart_Product_model.dart';
import 'package:click_n_ship/widgets/BackgroundTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Product.dart';
import '../widgets/circular_small_button.dart';
import '../widgets/custom_button.dart';

class Product_Details extends StatefulWidget {
  const Product_Details({super.key});

  @override
  State<Product_Details> createState() => _Product_DetailsState();
}

class _Product_DetailsState extends State<Product_Details> {
  int counter = 1;


  @override
  Widget build(BuildContext context) {
    final selected_Product =
        ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text('Products_Details'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Image.asset(
              "assets/Logo/Logo(NoText).png",
              height: 26.0,
            ),
          ),
        ],
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black54,
        centerTitle: true,
      ),
      body: BackgroundTab(
        childwiget: ListView(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Container(
                width: 80,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xFF355291),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "-${selected_Product.discountPercentage}%",
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Roboto",
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: 70,
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2)),
                  items: selected_Product.images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.network(i),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              "${selected_Product.title}",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: "Roboto",
                                  overflow: TextOverflow.visible,
                                  color: Color(0xFF355291)),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "\$ ${selected_Product.price}",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: "Roboto",
                              color: Color(0xFF0064001),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 180,
                            child: RatingBar.builder(
                              initialRating: selected_Product.rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 25,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Color(0xFF355291),//Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          Text('${selected_Product.rating}', style:  TextStyle(
                              fontFamily: "Roboto",fontSize: 16)),
                          Row(
                            children: [
                              Circular_small_Button(
                                icon: Icon(Icons.remove),
                                onPress: () {
                                  if (counter-1 > 0) {
                                    setState(() {
                                      counter--;
                                    });
                                  }
                                },
                              ),
                              const SizedBox(width: 20,),
                              Text(counter.toString(), style:  const TextStyle(
                              fontFamily: "Roboto",fontSize: 16)),
                              const SizedBox(width: 20,),
                              Circular_small_Button(
                                icon: Icon(Icons.add),
                                onPress: () {
                                  if (counter < selected_Product.stock) {
                                    setState(() {
                                      counter++;
                                    });
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        selected_Product.description,
                        style: const TextStyle(
                            fontSize: 17,
                            fontFamily: "Roboto",
                            color: Color(0xFF355291)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          const Text("Brand : " ,style:  TextStyle(
                              fontFamily: "Roboto",fontSize: 16)),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Text("${selected_Product.brand}" , style:  const TextStyle(
                              fontFamily: "Roboto",fontSize: 16
                            ),),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          const Text("Stock : " ,style:  TextStyle(
                              fontFamily: "Roboto",fontSize: 16)),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Text("${selected_Product.stock}" , style:  const TextStyle(
                                fontFamily: "Roboto",fontSize: 16
                            ),),
                          ),
                          Spacer(),
                          const Text("Category : " ,style:  TextStyle(
                              fontFamily: "Roboto",fontSize: 16)),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ]),
                            child: Text("${selected_Product.category}" , style:  const TextStyle(
                                fontFamily: "Roboto",fontSize: 16
                            ),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Custom_button( title: 'Add to cart',onPress: (){
              additem(selected_Product);
              const snackBar = SnackBar(
                content: Center(child: Text('Added to the cart !!')),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
            },),
           const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Future<void> additem(Product selected_product) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Cart_Product> musics = List.empty(growable: true);

    // fetch and decode data
    final String? musicsstring = await prefs.getString('Carts');

    // final List<Cart_Product>
    if (musicsstring != null) {
      musics = Cart_Product.decode(musicsstring);



      //  //add
      Cart_Product cartItem = Cart_Product(id: selected_product.id,
          title: selected_product.title,
          description: selected_product.description,
          price: selected_product.price,
          discountPercentage: selected_product.discountPercentage,
          rating: selected_product.rating,
          stock: selected_product.stock,
          quantity: counter,
          brand: selected_product.brand,
          category: selected_product.category,
          thumbnail: selected_product.thumbnail,
          images: selected_product.images);

      musics.add(cartItem);

      // encode and store data in sharedpreferences
      final String encodeddata = Cart_Product.encode(musics);

      await prefs.setString('Carts', encodeddata);
      print("End of Process");

    }else{
      //  //add
      Cart_Product cartItem = Cart_Product(id: selected_product.id,
          title: selected_product.title,
          description: selected_product.description,
          price: selected_product.price,
          discountPercentage: selected_product.discountPercentage,
          rating: selected_product.rating,
          stock: selected_product.stock,
          quantity: counter,
          brand: selected_product.brand,
          category: selected_product.category,
          thumbnail: selected_product.thumbnail,
          images: selected_product.images);

      musics.add(cartItem);

      // encode and store data in sharedpreferences
      final String encodeddata = Cart_Product.encode(musics);

      await prefs.setString('Carts', encodeddata);
      print("End of Process2");

    }


  }

}
