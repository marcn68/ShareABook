import 'package:flutter/material.dart';
import 'package:share_a_book/ui/pages/login.dart';

class CustomButtonStyle extends StatelessWidget {
  CustomButtonStyle(this.text, this.function, this.context);

  final String text;
  final String function;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: onGetStarted,
      padding: EdgeInsets.all(10.0),
      color: Color(0xff2395C8),
      textColor: Colors.black,
      child: Text(this.text, style: TextStyle(fontSize: 18)),
    );
  }

  void onGetStarted() async {
    print("hi");
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoginScreen()),
    );
  }

}