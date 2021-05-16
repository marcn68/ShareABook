import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_a_book/services/user/user_service.dart';

class UserServiceFirebase implements UserService {
  final _auth = FirebaseAuth.instance;

  @override
  Future changePassword({String newPassword, String oldPassword}) async {
    final user = _auth.currentUser;
    await reAuthenticateUser(
      user: user,
      password: oldPassword,
    );
    await user.updatePassword(newPassword);
  }

  @override
  Future deleteUser({String password}) async {
    final user = _auth.currentUser;
    await reAuthenticateUser(
      user: user,
      password: password,
    );
    user.delete();
  }

  @override
  Future updateUser({String userImage, String fullName}) async {
    final user = _auth.currentUser;
    await user.updateProfile(displayName: fullName, photoURL: userImage);
    return _auth.currentUser;
  }

  Future reAuthenticateUser({User user, String password}) async {
    await user.reauthenticateWithCredential(
      EmailAuthProvider.credential(
        email: _auth.currentUser.email,
        password: password,
      ),
    );
  }
}
