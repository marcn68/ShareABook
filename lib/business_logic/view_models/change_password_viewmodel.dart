import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/app/app.router.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/user/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  final UserService _userService = serviceLocator<UserService>();

  String msg;
  SnackBar snackBar;
  TextEditingController oldPassController;
  TextEditingController newPassController;
  TextEditingController confirmPassController;

  //void checkOldPass() {}

  void checkPassword() async {
    if (newPassController.text.toString() ==
        confirmPassController.text.toString()) {
      try {
        dynamic response = await _userService.changePassword(
            newPassword: newPassController.text.toString(),
            oldPassword: oldPassController.text.toString());
        msg = "Password Changed Succesfully";
        print(response);
        oldPassController.clear();
        newPassController.clear();
        confirmPassController.clear();
        //await serviceLocator<NavigationService>().navigateTo(Routes.myApp);
      } catch (e) {
        msg = e.toString();
        print(e.toString());
      }
    } else {
      msg = "Your passwords do not match";
    }
    notifyListeners();
  }
}
