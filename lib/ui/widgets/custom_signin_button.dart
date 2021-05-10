import 'package:flutter/material.dart';
import 'package:share_a_book/ui/pages/login.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class CustomSignInButton extends StatelessWidget {
  CustomSignInButton({this.text, this.provider, this.isMini, this.onPressed});

  final ButtonType provider;
  final String text;
  final bool isMini;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return isMini ?
    SignInButton.mini(
      buttonType: provider,
      onPressed: onPressed,
    ) :
    SignInButton(
        buttonType: provider,
        buttonSize: ButtonSize.small,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),
        btnText: text,
        onPressed: onPressed);
  }
}