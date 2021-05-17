import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/services/book/book_service.dart';
import 'package:share_a_book/services/database/database_service.dart';
import 'package:share_a_book/services/service_locator.dart';

class BookDetailViewModel extends ChangeNotifier {
  final DatabaseService _databaseService = serviceLocator<DatabaseService>();
  final BookService _bookService = serviceLocator<BookService>();

  int popularityCounter;
  // BookDocument bookDocument;

  AppUser user = AppUser();
  Future getUserFromDatabase(uid) async {
    dynamic test = await _databaseService.getUserFromDatabase(uid: uid);
    user.fullName = test['fullName'];
    user.email = test['email'];
    notifyListeners();
  }

  void updateBook(bookDocument) async {
    bookDocument.userBook.book.popularity = popularityCounter;
    await _bookService.updateBook(bookDocument);
  }
}
