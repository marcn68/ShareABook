import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:share_a_book/ui/pages/login.dart';

class CustomSignInButton extends StatelessWidget {
  CustomSignInButton({this.text, this.buttonsType, this.function});

  final String text;
  final Buttons buttonsType;
  final dynamic function;

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      buttonsType,
      text: text,
      onPressed: function,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

}