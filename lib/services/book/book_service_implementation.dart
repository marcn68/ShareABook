import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';
import 'package:share_a_book/services/web_api/web_api.dart';

import 'book_service.dart';

class BookServiceImplementation implements BookService {
  WebApi _webApi = serviceLocator<WebApi>();
  BackendApi _backendApi = serviceLocator<BackendApi>();

  @override
  Future<List<Book>> getBooksByISBN(isbn) async {
    List<Book> webData = await _webApi.getBookById(isbn);
    return webData;
  }

  Future<bool> sendBookInfo(book) async {
    bool response = await _backendApi.createBook(book);
    return response;
  }
}
