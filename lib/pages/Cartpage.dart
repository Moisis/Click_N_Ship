
import 'package:click_n_ship/widgets/BackgroundTab.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/Cart_Product_model.dart';
import '../widgets/custom_button.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  List<Cart_Product> musics = List.empty(growable: true);
  int totalprice = 0;

  @override
  void initState() {
    super.initState();
    getdata();
    gettotal();
    setState(() {});
  }

  getdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? musicsstring = prefs.getString('Carts');

    if (musicsstring != null) {
      musics = Cart_Product.decode(musicsstring);

      setState(() {});
    }
  }

  int gettotal() {
    int total = 0;
    musics.forEach((element) {
      total = total + (element.price * element.quantity);
    });

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundTab(
        childwiget: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: musics.length,
            itemBuilder: (context, index) {
              return Container(
                child: Center(
                  child: Container(
                    height: 110,
                    margin: const EdgeInsets.symmetric(vertical: 10 , horizontal: 7),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          margin: EdgeInsets.only(right: 15),
                          child: Image.network(
                            musics[index].thumbnail,
                            height: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  musics[index].title,
                                  overflow:  TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xFF355291)),
                                ),
                                width: 200,
                              ),
                              Text(
                                " ${musics[index].quantity} X ${musics[index].price} => (${musics[index].price * musics[index].quantity})",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  musics.remove(musics[index]);
                                  savenewdata(musics);
                                  setState(() {

                                  });
                                  const snackBar = SnackBar(
                                    content: Center(child: Text('Item deleted !!')),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      bottomSheet: musics.isEmpty
          ?  Center(
              child: Container(
                height: double.infinity,
                  width: double.infinity,
                  child: BackgroundTab(childwiget: Center(child: const Text("No Items added !!" , style: TextStyle(
                    fontSize: 32,fontFamily: "Roboto"
                  ),)),)),
            )
          : Container(
              color: Colors.grey[300],
              height: 200,
              child: Container(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          "Total Bag  :    ",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 22,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "${gettotal()}   EGP",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          "Tax & Delivery  :    ",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 22,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            "100  EGP",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          "Total :    ",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 22,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "${gettotal() + 100} EGP",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Custom_button(
                    title: 'CheckOut',
                    onPress: () {
                      const snackBar = SnackBar(
                        content: Center(child: Text('Order Placed !!')),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //clearCart();

                    },
                  ),
                ],
              )),
            ),
    );
  }

  Future<void> savenewdata(List<Cart_Product> musics) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodeddata = Cart_Product.encode(musics);
    await prefs.setString('Carts', encodeddata);

  }

  // Future<void> clearCart() async {
  //   musics.forEach((element) {
  //     musics.remove(element);
  //   });
  //   final SharedPreferences prefs =  await SharedPreferences.getInstance();
  //   prefs.remove('Carts');
  //   setState(() {
  //
  //   });
  // }
}
