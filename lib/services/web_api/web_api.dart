import 'package:share_a_book/business_logic/models/book.dart';

abstract class WebApi {
  Future<List<Book>> getBookById(isbn);
}
