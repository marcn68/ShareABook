import 'package:flutter/material.dart';

Widget CustomButtonStyle(String text) {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    onPressed: () {},
    padding: EdgeInsets.all(10.0),
    color: Color(0xff2395C8),
    textColor: Colors.black,
    child: Text(text, style: TextStyle(fontSize: 18)),
  );
}
