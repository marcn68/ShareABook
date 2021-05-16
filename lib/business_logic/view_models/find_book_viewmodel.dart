import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/services/book/book_service.dart';
import 'package:share_a_book/services/service_locator.dart';

class FindBookViewModel extends ChangeNotifier {
  BookService _bookService = serviceLocator<BookService>();

  String searchInput;
  List<BookDocument> _bookDocuments = [];

  List<BookDocument> get bookDocuments {
    return _bookDocuments;
  }

  void searchBookByTerm() async {
    _bookDocuments = await _bookService.searchBookByTerm(searchInput);
    notifyListeners();
  }
}
