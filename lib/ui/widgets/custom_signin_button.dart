import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:share_a_book/ui/pages/login.dart';

class CustomSignInButton extends StatelessWidget {
  CustomSignInButton({this.text, this.provider, this.onPressed});

  final String text;
  final Buttons provider;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      provider,
      text: text,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

}