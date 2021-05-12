import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.text, this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Color(0xff2395C8)))),
      ),
      onPressed: onPressed,
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(this.text,
              style: TextStyle(fontSize: 18, color: Colors.black))),
    );
  }
}
