import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/business_logic/models/order.dart';

abstract class BookService {
  Future<List<Book>> getBooksByISBN(isbn);
  // Create a new Book Object
  Future<bool> sendBookInfo(book);
  // Get a list of the most popular books
  Future<List<BookDocument>> popularBooks();
  // Get a list of all the user books
  Future<List<BookDocument>> userBookList();
  // Get a list of all the books based on the search query
  Future<List<BookDocument>> searchBookByTerm(searchTerm);

  Future updateBook(bookDocument);
}
