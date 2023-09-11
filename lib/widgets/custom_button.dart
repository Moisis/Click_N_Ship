import 'package:flutter/material.dart';

class Custom_button extends StatelessWidget {
  const Custom_button({
    super.key,
    required GlobalKey<FormState> formKey, required this.title,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {


        }
      },
      child:  Text(title),
    );
  }
}