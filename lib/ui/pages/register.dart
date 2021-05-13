import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/business_logic/view_models/register_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/custom_button.dart';
import 'package:share_a_book/ui/widgets/custom_signin_button.dart';
import 'package:share_a_book/ui/widgets/custom_input.dart';
import 'package:share_a_book/ui/widgets/custom_label.dart';
import 'package:sign_button/constants.dart';

import 'login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  RegisterViewModel model = serviceLocator<RegisterViewModel>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.PRIMARY_BLUE,
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
                    color: Constants.SECONDARY_BLUE,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomLabel(text: "Register", fontSize: 20.0),
                      SizedBox(height: 10),
                      CustomInput(label: "Email", verticalPadding: 10, controller: _emailController),
                      CustomInput(label: "Password", verticalPadding: 10, controller: _passwordController),
                      CustomInput(label: "Confirm Password", verticalPadding: 10, controller: _confirmPasswordController),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          height: 42.0,
                          child:
                              CustomButton(text: "Register", onPressed: () {model.signUpWithEmailAndPassword(_emailController.text, _passwordController.text, _confirmPasswordController.text, context);})),
                      CustomLabel(text: "Or register with", fontSize: 16.0),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 40.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSignInButton(
                                  text: "",
                                  provider: ButtonType.google,
                                  isMini: true,
                                  onPressed: () {model.signUpWithGoogle(context);}),
                              CustomSignInButton(
                                  text: "",
                                  provider: ButtonType.facebook,
                                  isMini: true,
                                  onPressed: () {model.signUpWithFacebook(context);})
                            ],
                          )),
                      Divider(
                        color: Colors.black,
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                          height: 42.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomLabel(
                                  text: "Already have an account?",
                                  fontSize: 16.0),
                              SizedBox(width: 20),
                              CustomButton(
                                  text: "Login", onPressed: (){model.navigateToLogin(context);})
                            ],
                          )),
                    ],
                  ),
                ),
              ]),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
