import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/services/book/book_service.dart';
import 'package:share_a_book/services/database/database_service.dart';
import 'package:share_a_book/services/service_locator.dart';

class BookDetailViewModel extends ChangeNotifier {
  final DatabaseService _databaseService = serviceLocator<DatabaseService>();

  AppUser user;

  Future getUserFromDatabase(uid) async {
    user = await _databaseService.getUserFromDatabase(uid: uid);
    notifyListeners();
  }
}
