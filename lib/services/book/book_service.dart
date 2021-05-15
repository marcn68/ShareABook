import 'package:share_a_book/business_logic/models/book.dart';

abstract class BookService {
  Future<List<Book>> getBooksByISBN(isbn);

  Future<bool> sendBookInfo(book);
}
