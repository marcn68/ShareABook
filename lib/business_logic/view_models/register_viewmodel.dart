import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/ui/pages/home.dart';
import 'package:share_a_book/ui/pages/login.dart';
import 'package:share_a_book/ui/widgets/alert_dialog.dart';

class RegisterViewModel extends ChangeNotifier {
  AuthService _authService = serviceLocator<AuthService>();

  Future signUpWithEmailAndPassword(email, password, confirmPassword, context) async {
    if(password != confirmPassword){
      showAlertDialog(context);
    }else {
      AppUser _user = await _authService.registerWithEmailAndPassword(
          email, password);
      notifyListeners();
      if (_user != null) {
        navigateToLogin(context);
      }
    }
  }

  Future signUpWithGoogle(context) async {
    AppUser _user = await _authService.signInWithGoogle();
    notifyListeners();
    if (_user != null) {
      navigateToHome(context);
    }
  }

  Future signUpWithFacebook(context) async {
    AppUser _user = await _authService.signInWithFacebook();
    notifyListeners();
    if (_user != null) {
      navigateToHome(context);
    }
  }

  Future navigateToLogin(context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  Future navigateToHome(context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}
