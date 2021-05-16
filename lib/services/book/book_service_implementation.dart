import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/business_logic/models/user_book.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';
import 'package:share_a_book/services/web_api/web_api.dart';

import 'book_service.dart';

class BookServiceImplementation implements BookService {
  WebApi _webApi = serviceLocator<WebApi>();
  BackendApi _backendApi = serviceLocator<BackendApi>();

  List<Book> books = [];

  @override
  Future<List<Book>> getBooksByISBN(isbn) async {
    List<Book> webData = await _webApi.getBookById(isbn);
    return webData;
  }

  @override
  Future<bool> sendBookInfo(book) async {
    bool response = await _backendApi.createBook(book);
    return response;
  }

  @override
  Future<List<Book>> popularBooks() async {
    books = await _backendApi.getPopularBooks();
    return books;
  }

  @override
  Future<List<Book>> searchBookByTerm(searchTerm) {
    // books =
    // return books;
  }

  @override
  Future<List<Book>> userBookList() async {
    // books = await _backendApi.getLoggedInUserBooks();
    // return books;
  }
}
