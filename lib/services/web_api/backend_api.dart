import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/business_logic/models/order.dart';

abstract class BackendApi {
  Future<bool> createBook(Book book);
  Future updateBook(BookDocument bookDocument);
  Future<List<BookDocument>> getPopularBooks();
  Future<List<BookDocument>> getLoggedInUserBooks();
  Future<List<Order>> getOrders();
}
