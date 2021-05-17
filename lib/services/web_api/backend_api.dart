import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/business_logic/models/order.dart';

abstract class BackendApi {
  Future<bool> createBook(Book book);
  Future<List<Book>> getPopularBooks();
  Future<List<Book>> getLoggedInUserBooks(userId);
  Future<List<Order>> getOrders();
}
