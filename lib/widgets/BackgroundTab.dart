import 'package:flutter/material.dart';
class BackgroundTab extends StatelessWidget {
   BackgroundTab({
    super.key, required this.childwiget,
  });

   Widget childwiget ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
        color: Color(0xFFedeCF2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: childwiget,
    );
  }
}