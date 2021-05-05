import 'package:share_a_book/business_logic/models/book.dart';

abstract class BookAddService {
  Future<List<Book>> getBooksByISBN(isbn);
}
