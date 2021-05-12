import 'package:share_a_book/business_logic/models/book.dart';

abstract class BackendApi {
  Future<bool> createBook(Book book);
}
