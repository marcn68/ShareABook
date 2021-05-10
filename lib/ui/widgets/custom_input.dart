import 'package:flutter/material.dart';
import 'package:share_a_book/shared/constants.dart';

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
      ),
    );
  }
}
