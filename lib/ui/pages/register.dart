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
import 'package:stacked_services/stacked_services.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  RegisterViewModel model = serviceLocator<RegisterViewModel>();

  @override
  void initState() {
    model.fullnameController = TextEditingController();
    model.emailController = TextEditingController();
    model.passwordController = TextEditingController();
    model.confirmPasswordController = TextEditingController();
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomLabel(text: "Register", fontSize: 20.0),
                      SizedBox(height: 10),
                      CustomInput(label: "Fullname", verticalPadding: 5, controller: model.fullnameController),
                      CustomInput(label: "Email", verticalPadding: 5, controller: model.emailController),
                      CustomInput(label: "Password", verticalPadding: 5, controller: model.passwordController, isObscured: true),
                      CustomInput(label: "Confirm Password", verticalPadding: 5, controller: model.confirmPasswordController, isObscured: true),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          height: 42.0,
                          child:
                              CustomButton(text: "Register", onPressed: () {model.signUpWithEmailAndPassword();})),
                      CustomLabel(text: "Or register with", fontSize: 16.0),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          height: 40.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSignInButton(
                                  text: "",
                                  provider: ButtonType.google,
                                  isMini: true,
                                  onPressed: () {model.signUpWithGoogle();}),
                              CustomSignInButton(
                                  text: "",
                                  provider: ButtonType.facebook,
                                  isMini: true,
                                  onPressed: () {model.signUpWithFacebook();})
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
                                  text: "Login", onPressed: (){serviceLocator<NavigationService>().back();})
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
