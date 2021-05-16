import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/app/app.router.dart';
import 'package:share_a_book/business_logic/view_models/login_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/custom_button.dart';
import 'package:share_a_book/ui/widgets/custom_signin_button.dart';
import 'package:share_a_book/ui/widgets/custom_input.dart';
import 'package:share_a_book/ui/widgets/custom_label.dart';
import 'package:sign_button/constants.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel model = serviceLocator<LoginViewModel>();

  @override
  void initState() {
    model.emailController = TextEditingController();
    model.passwordController = TextEditingController();
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
                  child: Image.asset("assets/logo.png", scale: 2.2),
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
                    children: <Widget>[
                      CustomLabel(text: "Login", fontSize: 20.0),
                      CustomInput(label: "Email", verticalPadding: 16, controller: model.emailController),
                      CustomInput(label: "Password", verticalPadding: 16, controller: model.passwordController, isObscured: true),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          height: 42.0,
                          child: CustomButton(text: "Login", onPressed: (){model.signInWithEmailAndPassword();})),
                      CustomLabel(text: "Or login with", fontSize: 16.0),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          height: 45.0,
                          child: CustomSignInButton(
                              text: "Login with Google",
                              provider: ButtonType.google,
                              isMini: false,
                              onPressed:  () {model.signInWithGoogle();})),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          height: 45.0,
                          child: CustomSignInButton(
                              text: "Login with Facebook",
                              provider: ButtonType.facebook,
                              isMini: false,
                              onPressed:  () {model.signInWithFacebook();})),
                      CustomLabel(
                          text: "Don't have an account?", fontSize: 16.0),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 42.0,
                          child: CustomButton(
                              text: "Register", onPressed: () { serviceLocator<NavigationService>().navigateTo(Routes.registerScreen);})),
                    ],
                  ),
                ),
              ]),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
