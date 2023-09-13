import 'package:flutter/material.dart';

class Circular_small_Button extends StatelessWidget {

  Circular_small_Button({required this.icon, required this.onPress});

  final VoidCallback onPress;
  final Icon icon ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
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
        child: icon,
      ),
    );
  }
}