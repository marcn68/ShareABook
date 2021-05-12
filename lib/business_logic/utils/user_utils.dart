import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_a_book/business_logic/models/user.dart';

class UserUtils {
  static AppUser userFromFirebaseUser(User user) {
    return user != null
        ? AppUser(
            uid: user.uid,
            email: user.email,
            fullName: user.displayName ?? "New User")
        : null;
  }
}
