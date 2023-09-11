import 'package:click_n_ship/widgets/BackgroundTab.dart';
import 'package:flutter/material.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getdata();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundTab(
        childwiget: Container(
      color: Colors.black38,
      height: 200,
    ));
  }
}
