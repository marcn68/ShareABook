import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/services/database/database_service.dart';

class DatabaseServiceFirestore implements DatabaseService {
  final _usersRef = FirebaseFirestore.instance.collection('users');
  @override
  Future getUserFromDatabase({String uid}) async {
    return (await _usersRef.doc(uid).get()).data();
  }

  @override
  Future initializeUserInDatabase({AppUser user}) async {
    return await _usersRef.doc(user.uid).set({
      'fullName': user.fullName,
      'email': user.email,
      'provider': user.provider,
      'books': [],
    });
  }

  @override
  Future removeUserFromDatabase({String uid}) async {
    // TODO: Remove all the books selled by this user or soft delete them
    return await _usersRef.doc(uid).delete();
  }

  @override
  Future updateUserInDatabase({AppUser user}) async {
    return await _usersRef.doc(user.uid).set({
      'fullName': user.fullName,
      'email': user.email,
      'provider': user.provider,
    });
  }
}
