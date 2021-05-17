import 'package:algolia/algolia.dart';
import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';
import 'package:share_a_book/services/web_api/web_api.dart';

import '../../main.dart';
import 'book_service.dart';

class BookServiceImplementation implements BookService {
  WebApi _webApi = serviceLocator<WebApi>();
  BackendApi _backendApi = serviceLocator<BackendApi>();

  List<BookDocument> bookDocuments = [];

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
  Future<List<BookDocument>> popularBooks() async {
    bookDocuments = await _backendApi.getPopularBooks();
    return bookDocuments;
  }

  @override
  Future<List<BookDocument>> searchBookByTerm(searchTerm) async {
    Algolia algolia = Application.algolia;
    AlgoliaQuery query = algolia.instance.index('books').query(searchTerm);
    AlgoliaQuerySnapshot snap = await query.getObjects();
    return snap.hits
        .map((e) => BookDocument.fromJson(e.data))
        .cast<BookDocument>()
        .toList();
  }

  @override
  Future<List<BookDocument>> userBookList() async {
    bookDocuments = await _backendApi.getLoggedInUserBooks();
    return bookDocuments;
  }

  @override
  Future updateBook(bookDocument) async {
    await _backendApi.updateBook(bookDocument);
  }
}
