import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/ui/pages/home.dart';
import 'package:share_a_book/ui/pages/register.dart';

class LoginViewModel extends ChangeNotifier {
  AuthService _authService = serviceLocator<AuthService>();

  Future signInWithEmailAndPassword(email, password, context) async {
    AppUser _user =
        await _authService.signInWithEmailAndPassword(email, password);
    notifyListeners();
    if (_user != null) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  Future signInWithGoogle(context) async {
    AppUser _user = await _authService.signInWithGoogle();
    notifyListeners();
    if (_user != null) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  Future signInWithFacebook(context) async {
    AppUser _user = await _authService.signInWithFacebook();
    notifyListeners();
    if (_user != null) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  Future navigateToRegister(context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }
}
