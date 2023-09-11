import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Stack(
              children: [
                const Center(
                    child: Image(
                        image:
                            AssetImage('assets/Logo/Logo_Shopping_Page.png'))),
                // Load a Lottie file from your assets
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 200, top: 200),
                    child: Lottie.asset('assets/s8PVml7Uwh.json',
                        height: 150, width: 150, fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
            const Text(
              "Click 'N Ship",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF15213D)),
            ),
          ],
        ),
      ),
    );
  }
}
