import 'package:flutter/material.dart';

class Custom_button extends StatelessWidget {

  Custom_button( {required this.title, required this.onPress});

  final String title ;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Color(0xFF355291),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPress,
      child:  Text(title),
    );
  }


}