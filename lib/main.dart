
import 'package:click_n_ship/pages/Homepage.dart';
import 'package:click_n_ship/pages/Login_page.dart';
import 'package:click_n_ship/pages/SignUp_page.dart';
import 'package:click_n_ship/pages/lol.dart';
import 'package:click_n_ship/pages/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute:'/lol' ,
        routes: {
          '/': (context) => Homepage(),
          // '/cartpage'  : (context) => Cartpage() ,
          '/splash'  : (context) => const SplashScreen() ,
          '/Login_Page'  : (context) => Login_Page() ,
          '/SignUp_Page'  : (context) => SignUp_Page() ,
          '/lol'  : (context) => Login() ,

        });
  }
}



