import 'package:flutter/material.dart';

class CustomLabelStyle extends StatelessWidget {
  CustomLabelStyle(this.text, this.fontSize);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}