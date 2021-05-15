import 'package:share_a_book/business_logic/models/user.dart';

abstract class DatabaseService {
  Future initializeUserInDatabase({AppUser user});
  Future updateUserInDatabase({AppUser user});
  Future removeUserFromDatabase({String uid});
  Future getUserFromDatabase({String uid});
}
