
import 'package:click_n_ship/pages/Cartpage.dart';
import 'package:click_n_ship/pages/Profilepage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ProductsPage.dart';
import 'package:badges/badges.dart' as badges;




class Homepage extends StatefulWidget {


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;

  int? cartitems;


  @override
  void initState() {
    intialGetSavedData();
    super.initState();

  }
  Future<void> intialGetSavedData() async {
     final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
     cartitems = sharedprefs.getInt("key")?? 0 ;

  }
  
  Future<void> storedata() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    sharedprefs.setInt("key", cartitems!);

  }


  Map<int, String> pages = {
    0: "Click 'N Ship",
    1: "Cart",
    2: "Profile ",
  };



  final screens = [
     ProductsPage( ),
    Cartpage(),
     ProfilePage(),
  ];

  void  updatehome(){
      setState(() {

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Image(image: AssetImage('assets/Logo/Logo(NoText).png')),
        title: Text('${pages[index]}'),
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black54,
        centerTitle: true,
      ),
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey.shade300,
          onTap: (selected_index) {
            setState(() {
              index = selected_index;
            });
          },
          height: 70,
          color: Color(0xFF15213D),
          index: index,
          items:  [
            Icon(Icons.home, size: 30, color: Colors.white),
            badges.Badge(
              showBadge: ( cartitems != null? cartitems! > 0 : false) ,
              badgeContent: Text("${cartitems ?? ""}" ),
                child: Icon(Icons.shopping_cart, size: 30, color: Colors.white)),
            Icon(Icons.settings, size: 30, color: Colors.white),
          ],
      ),
    );
  }

  getselectedWidget({required int index}) {
    Widget widget = Container();
    switch (index) {
      case 0:
        widget = ProductsPage();
      case 1:
        widget = Cartpage();
        break;
      case 2:
        widget = ProfilePage();
      default:
        widget = Container(
          child: Text('ERROR , GO back'),
        );
    }
    return widget;
  }



}
