import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/Product.dart';
import '../models/Products_list.dart';
import '../pages/Homepage.dart';

class Item_Widget extends StatefulWidget {
  const Item_Widget({Key? key}) : super(key: key);

  @override
  State<Item_Widget> createState() => _Item_WidgetState();
}

class _Item_WidgetState extends State<Item_Widget> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  late Products_list dataFromAPI;
  _getData() async {
    try {
      http.Response res = await http.get(Uri.parse("https://dummyjson.com/products"));
      if (res.statusCode == 200) {
        dataFromAPI = Products_list.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ProductsListbuilder(
            dataFromAPI.products
          );
  }
}

class ProductsListbuilder extends StatefulWidget {
  final List<Product> products;


  const ProductsListbuilder(this.products,  {super.key,});

  @override
  State<ProductsListbuilder> createState() => _ProductsListbuilderState();
}

class _ProductsListbuilderState extends State<ProductsListbuilder> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = this.widget.products;

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: (){
              print("${products[index].id}");
              Navigator.pushNamed(context, "/Product_Details" , arguments: products[index] );


            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xFF355291),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "-${products[index].discountPercentage}%",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Roboto",
                              color: Colors.white),
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(3),
                    child: Image.network(
                      "${products[index].thumbnail}",
                      height: 80,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${products[index].title}",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          color: Color(0xFF355291),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${products[index].description}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 12,
                        color: Color(0xFF6E6E6E),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "\$ ${products[index].price}",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF006400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ),


          );
        });
  }
  @override
  void dispose() {
    super.dispose();
  }
}
