import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/ui/widgets/custom_button.dart';
import 'package:share_a_book/ui/widgets/custom_signin_button.dart';
import 'package:share_a_book/ui/widgets/custom_input.dart';
import 'package:share_a_book/ui/widgets/custom_label.dart';
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
                          child: CustomButton(text: "Login", onPressed: (){})
                      ),
                      CustomLabel(text: "Or login with", fontSize: 16.0),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          height: 45.0,
                          width: 200,
                          child: CustomSignInButton(text: "Login with Google", provider: Buttons.Google, onPressed: (){})
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          height: 45.0,
                          width: 200,
                          child:CustomSignInButton(text: "Login with Facebook", provider: Buttons.Facebook, onPressed: (){})
                      ),
                      CustomLabel(text: "Don't have an account?", fontSize: 16.0),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 42.0,
                          child: CustomButton(text: "Register", onPressed: (){})
                      ),
                    ],
                  ),
                ),
              ]),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

