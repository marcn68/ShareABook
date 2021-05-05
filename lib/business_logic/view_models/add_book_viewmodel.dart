import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/services/book_add/book_add_service.dart';
import 'package:share_a_book/services/service_locator.dart';

class AddBookViewModel extends ChangeNotifier {
  final BookAddService _bookAddService = serviceLocator<BookAddService>();

  List<Book> _books = [];

  List<Book> get books {
    return _books;
  }

  void getBookInfo(isbn) async {
    _books = await _bookAddService.getBooksByISBN(isbn);
    notifyListeners();
  }
}

class BookPresentation {
  final int isbn;
  final String bookTitle;
  final List<String> auhtors;
  final publishDate;
  final int numberOfPages;

  BookPresentation(
      {this.isbn,
      this.bookTitle,
      this.auhtors,
      this.publishDate,
      this.numberOfPages});
}
