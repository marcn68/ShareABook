import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/ui/pages/login.dart';
import 'package:share_a_book/ui/widgets/alert_dialog.dart';

class RegisterViewModel extends ChangeNotifier {
  AuthService _authService = serviceLocator<AuthService>();
  TextEditingController emailController ;
  TextEditingController passwordController ;
  TextEditingController confirmPasswordController ;

  Future signUpWithEmailAndPassword(context) async {
    if(passwordController.text != confirmPasswordController.text){
      showAlertDialog(context);
    }else {
      print(emailController.text + " " + passwordController.text);
      /*AppUser _user = await _authService.registerWithEmailAndPassword(
          emailController.text, passwordController.text);
      notifyListeners();
      if (_user != null) {
        navigateToLogin(context);
      }*/
    }
  }

  Future signUpWithGoogle(context) async {
    await _authService.signInWithGoogle();
    notifyListeners();
  }

  Future signUpWithFacebook(context) async {
    await _authService.signInWithFacebook();
    notifyListeners();
  }

  Future navigateToLogin(context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
