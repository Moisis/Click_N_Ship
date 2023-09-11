import 'package:carousel_slider/carousel_slider.dart';
import 'package:click_n_ship/widgets/BackgroundTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/Product.dart';
import '../widgets/circular_small_button.dart';

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
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          Text('${selected_Product.rating}'),
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
                              Text(counter.toString()),
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
                        "${selected_Product.description}",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Roboto",
                            color: Color(0xFF355291)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Text("Stock : "),
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
                            child: Text("${selected_Product.stock}"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
