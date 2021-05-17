import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/business_logic/utils/user_utils.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/database/database_service.dart';
import 'package:share_a_book/services/service_locator.dart';

class LoginViewModel extends ChangeNotifier {
  AuthService _authService = serviceLocator<AuthService>();
  final DatabaseService _databaseService = serviceLocator<DatabaseService>();
  TextEditingController emailController;
  TextEditingController passwordController;

  Future signInWithEmailAndPassword() async {
    await _authService.signInWithEmailAndPassword(
        emailController.text, passwordController.text);
  }

  Future signInWithGoogle() async {
    UserCredential _userCredential = await _authService.signInWithGoogle();
    AppUser appUser = UserUtils.userFromFirebaseUser(_userCredential.user);
    if (_userCredential.additionalUserInfo.isNewUser) {
      _databaseService.initializeUserInDatabase(user: appUser);
    }
  }

  Future signInWithFacebook() async {
    UserCredential _userCredential = await _authService.signInWithFacebook();
    AppUser appUser = UserUtils.userFromFirebaseUser(_userCredential.user);
    if (_userCredential.additionalUserInfo.isNewUser) {
      _databaseService.initializeUserInDatabase(user: appUser);
    }
  }
}
