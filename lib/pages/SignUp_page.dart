import 'package:click_n_ship/widgets/BackgroundTab.dart';
import 'package:flutter/material.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({super.key});

  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  @override
  Widget build(BuildContext context) {
    return BackgroundTab(childwiget: Center(
      child: Container(
        color: Colors.yellow,
        height: 20,
      ),
    ));
  }
}
