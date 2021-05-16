import 'package:flutter/material.dart';
import 'package:share_a_book/shared/constants.dart';

class CustomInput extends StatelessWidget {
  CustomInput({this.label, this.verticalPadding, this.controller, this.isObscured});

  final String label;
  final double verticalPadding;
  final TextEditingController controller;
  final bool isObscured;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: verticalPadding),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.PRIMARY_ORANGE, width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.PRIMARY_ORANGE, width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          hintText: label,
        ),
        obscureText: isObscured != null ? isObscured : false,
      ),
    );
  }
}
