import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/user/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  final UserService _userService = serviceLocator<UserService>();
  final SnackbarService _snackbarService = serviceLocator<SnackbarService>();

  String msg;
  TextEditingController oldPassController;
  TextEditingController newPassController;
  TextEditingController confirmPassController;

  void checkPassword() async {
    if (newPassController.text.toString() ==
        confirmPassController.text.toString()) {
      try {
        await _userService.changePassword(
            newPassword: newPassController.text.toString(),
            oldPassword: oldPassController.text.toString());
        msg = "Password Changed Succesfully";
        oldPassController.clear();
        newPassController.clear();
        confirmPassController.clear();
      } catch (e) {
        msg = e.toString();
        oldPassController.clear();
        newPassController.clear();
        confirmPassController.clear();
        print(e.toString());
      }
    } else {
      msg = "Your passwords do not match";
      newPassController.clear();
      confirmPassController.clear();
    }
    _snackbarService.showSnackbar(message: msg);
    notifyListeners();
  }
}
