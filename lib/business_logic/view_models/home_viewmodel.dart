import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/services/book/book_service.dart';
import 'package:share_a_book/services/service_locator.dart';

class HomeViewModel extends ChangeNotifier {
  BookService _bookService = serviceLocator<BookService>();

  List<BookDocument> _bookDocuments = [];

  List<BookDocument> get bookDocuments {
    return _bookDocuments;
  }

  Future getPopularBooks() async {
    _bookDocuments = await _bookService.popularBooks();
    notifyListeners();
  }
}
