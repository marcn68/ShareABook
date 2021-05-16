import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/business_logic/utils/user_utils.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/database/database_service.dart';
import 'package:share_a_book/services/database/database_service_firestore.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/ui/widgets/alert_dialog.dart';
import 'package:share_a_book/services/user/user_service.dart';
import 'package:stacked_services/stacked_services.dart';


class RegisterViewModel extends ChangeNotifier {
  AuthService _authService = serviceLocator<AuthService>();
  TextEditingController fullnameController ;
  TextEditingController emailController ;
  TextEditingController passwordController ;
  TextEditingController confirmPasswordController ;
  final DatabaseService _databaseService = serviceLocator<DatabaseService>();
  final UserService _userService = serviceLocator<UserService>();

  Future signUpWithEmailAndPassword() async {
    if(passwordController.text != confirmPasswordController.text){
      await serviceLocator<DialogService>().showDialog(title: "Invalid Password", description: "Password does not match");
    }else {
      print(emailController.text + " " + passwordController.text + " / " + fullnameController.text);
      UserCredential _userCredential = await _authService.registerWithEmailAndPassword(emailController.text, passwordController.text);
      _userService.updateUser(fullName: fullnameController.text);
      AppUser appUser = UserUtils.userFromFirebaseUser(_userCredential.user);
      if (_userCredential.additionalUserInfo.isNewUser) {
        _databaseService.initializeUserInDatabase(user: appUser);
      }
      notifyListeners();
    }
  }

  Future signUpWithGoogle() async {
    await _authService.signInWithGoogle();
    notifyListeners();
  }

  Future signUpWithFacebook() async {
    await _authService.signInWithFacebook();
    notifyListeners();
  }
}
