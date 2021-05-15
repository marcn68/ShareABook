import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/business_logic/utils/user_utils.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';

class AuthServiceFirebase implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  @override
  Stream<AppUser> get currentUserStream {
    return _auth.authStateChanges().map(UserUtils.userFromFirebaseUser);
  }

  @override
  AppUser get currentUser {
    return UserUtils.userFromFirebaseUser(_auth.currentUser);
  }

  @override
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future signInWithFacebook() async {
    try {
      final LoginResult loginResult = await _facebookAuth.login();

      final OAuthCredential credential =
          FacebookAuthProvider.credential(loginResult.accessToken.token);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
