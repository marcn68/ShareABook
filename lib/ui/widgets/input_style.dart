import 'package:flutter/material.dart';

class CustomInputStyle extends StatelessWidget {
  CustomInputStyle(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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