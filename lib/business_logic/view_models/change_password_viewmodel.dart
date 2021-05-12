import 'package:flutter/foundation.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  String oldPass;
  String newPass;
  String confirmPass;

  void checkOldPass(oldPass) {}

  void changePassword(newPass) {}

  void checkPassword(newPass, confirmPass) {}
}
