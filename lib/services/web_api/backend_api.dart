import 'package:share_a_book/business_logic/models/book.dart';

abstract class BackendApi {
  Future<bool> createBook(Book book);
  Future<List<Book>> getBooksOfTheWeek();
  Future<List<Book>> getLoggedInUserBooks(userId);
}
