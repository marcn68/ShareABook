import 'package:share_a_book/business_logic/models/user.dart';

abstract class AuthService {
  // get user stream
  Stream<AppUser> get currentUserStream;

  // get logged in user
  AppUser get currentUser;

  // get logged in user token
  Future getCurrentUserToken();

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password);

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password);

  // sign in with google
  Future signInWithGoogle();

  // sign in with facebook
  Future signInWithFacebook();

  // sign out
  Future signOut();
}
