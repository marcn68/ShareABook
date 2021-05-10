import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput({this.label, this.verticalPadding});

  final String label;
  final double verticalPadding;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: verticalPadding),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffFEBB47), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffFEBB47), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          hintText: label,
        ),
      ),
    );
  }
}