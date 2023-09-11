
import 'package:click_n_ship/pages/Homepage.dart';
import 'package:click_n_ship/pages/Product_Details.dart';
import 'package:click_n_ship/pages/SignUp_page.dart';
import 'package:click_n_ship/pages/Login_page.dart';
import 'package:click_n_ship/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        initialRoute:'/' ,
        routes: {
          '/': (context) => Homepage(),
          // '/cartpage'  : (context) => Cartpage() ,
          '/splash'  : (context) => const SplashScreen() ,
          '/Login_Page'  : (context) => Login() ,
          '/SignUp_Page'  : (context) => SignUp_Page() ,
          '/Product_Details'  : (context) => Product_Details()
          // '/lol2'  : (context) => lol() ,

        });
  }
}



