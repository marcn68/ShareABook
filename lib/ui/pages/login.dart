import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/ui/widgets/button_style.dart';
import 'package:share_a_book/ui/widgets/signin_button_style.dart';
import 'package:share_a_book/ui/widgets/input_style.dart';
import 'package:share_a_book/ui/widgets/label_style.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2395C8),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Icon(
                    Icons.book_online,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
                Container(
                  height: 559,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                      width: 8,
                    ),
                    color: Color(0xffDFEEF5),
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(50.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomLabel(text: "Login", fontSize: 20.0),
                      CustomInput(label: "Email"),
                      CustomInput(label: "Password"),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          height: 42.0,
                          child: CustomButton(text: "Login", function: function)
                      ),
                      CustomLabel(text: "Or login with", fontSize: 16.0),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          height: 45.0,
                          width: 200,
                          child: CustomSignInButton(text: "Login with Google", buttonsType: Buttons.Google, function: function)
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          height: 45.0,
                          width: 200,
                          child:CustomSignInButton(text: "Login with Facebook", buttonsType: Buttons.Facebook, function: function)
                      ),
                      CustomLabel(text: "Don't have an account?", fontSize: 16.0),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 42.0,
                          child: CustomButton(text: "GET STARTED", function: function)
                      ),
                    ],
                  ),
                ),
              ]),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  /*Functions*/
  /*To change*/
  dynamic function() async { }
}

