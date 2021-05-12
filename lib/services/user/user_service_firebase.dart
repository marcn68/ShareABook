import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_a_book/services/user/user_service.dart';

class UserServiceFirebase implements UserService {
  final _auth = FirebaseAuth.instance;

  @override
  Future changePassword({String newPassword}) async {
    final user = _auth.currentUser;
    await user.updatePassword(newPassword);
  }

  @override
  Future deleteUser() async {
    final user = _auth.currentUser;
    user.delete();
  }

  @override
  Future updateUser({String userImage, String fullName}) async {
    final user = _auth.currentUser;
    await user.updateProfile(displayName: fullName, photoURL: userImage);
  }
}
