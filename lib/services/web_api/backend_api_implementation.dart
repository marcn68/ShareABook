import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';
import 'package:http/http.dart' as http;

class BackendApiImplementation implements BackendApi {
  final _host = "https://share-a-book.herokuapp.com";
  final _path = "books";
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    //'Authentication': 'Bearer ${user.getIdToken()}'
  };
  List<Book> _books;

  @override
  Future<bool> createBook(Book book) async {
    final bookJson = book.toJson();
    final response = await http.post(
      Uri.https(_host, _path),
      headers: _headers,
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
  Future<List<Book>> getBooksOfTheWeek() async {
    /*To change*/
    final uri = Uri.https(_host, _path + '/booksOfTheWeek');
    var response = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(response.body);
    _books = jsonObject;
    return _books;
  }

  @override
  Future<List<Book>> getLoggedInUserBooks(userId) async {
    /*To change*/
    var queryParameters = {'id': userId};
    final uri = Uri.https(_host, _path, queryParameters);
    var response = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(response.body);
    _books = jsonObject;
    return _books;
  }
}
