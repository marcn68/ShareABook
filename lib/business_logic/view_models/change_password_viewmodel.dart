import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/user/user_service.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  final UserService _userService = serviceLocator<UserService>();

  // String oldPass;
  // String newPass;
  // String confirmPass;
  String msg;

  TextEditingController oldPassController;
  TextEditingController newPassController;
  TextEditingController confirmPassController;

  void checkOldPass() {}

  String checkPassword() {
    if (newPassController.text.toString() ==
        confirmPassController.text.toString()) {
      _userService.changePassword(
          newPassword: newPassController.text.toString(),
          oldPassword: oldPassController.text.toString());
    } else {
      msg = "Your passwords do not match";
      return msg;
    }
  }
}
