import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:share_a_book/ui/pages/login.dart';

class CustomSignInButtonStyle extends StatelessWidget {
  CustomSignInButtonStyle(this.text, this.buttonsType, this.function, this.context);

  final String text;
  final Buttons buttonsType;
  final String function;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      buttonsType,
      text: text,
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

}