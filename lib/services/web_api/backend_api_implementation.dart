import 'dart:convert';

import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/business_logic/models/order.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';
import 'package:http/http.dart' as http;

class BackendApiImplementation implements BackendApi {
  final AuthService _authService = serviceLocator<AuthService>();
  String token;
  final _host = "share-a-book.herokuapp.com";
  final _path = "book";

  List<BookDocument> _bookDocuments;

  Future<Map<String, String>> get header async {
    token = await _authService.getCurrentUserToken();
    Map<String, String> _headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    return _headers;
  }

  @override
  Future<bool> createBook(Book book) async {
    final bookJson = book.toJson();
    final response = await http.post(
      Uri.https(_host, _path),
      headers: await header,
      body: jsonEncode(<String, dynamic>{
        'book': bookJson,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future updateBook(BookDocument bookDocument) async {
    final bookDocumentJson = bookDocument.toJson();
    final response =
        await http.put(Uri.https(_host, _path + '/${bookDocument.objectID}'),
            headers: await header,
            body: jsonEncode(<String, dynamic>{
              'bookDocument': bookDocumentJson,
            }));
  }

  @override
  Future<List<BookDocument>> getPopularBooks() async {
    final uri = Uri.https(_host, _path);
    var response = await http.get(uri, headers: await header);
    final jsonObject = json.decode(response.body);
    _bookDocuments = jsonObject["bookDocuments"]
        .map<BookDocument>((json) => BookDocument.fromJson(json))
        .toList();
    return _bookDocuments;
  }

  @override
  Future<List<BookDocument>> getLoggedInUserBooks() async {
    final uri = Uri.https(_host, _path + '/user');
    var response = await http.get(uri, headers: await header);
    final jsonObject = json.decode(response.body);
    _bookDocuments = jsonObject["bookDocuments"]
        .map<BookDocument>((json) => BookDocument.fromJson(json))
        .toList();
    return _bookDocuments;
  }

  @override
  Future<List<Order>> getOrders() async {
    /*To change*/
    final uri = Uri.https(_host, _path + '/orders');
    var response = await http.get(uri, headers: await header);
    final jsonObject = json.decode(response.body);
    return jsonObject;
  }
}
