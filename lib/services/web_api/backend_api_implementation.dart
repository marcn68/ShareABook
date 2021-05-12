import 'dart:convert';

import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';
import 'package:http/http.dart' as http;

class BackendApiImplementation implements BackendApi {
  final _host = "openlibrary.org";
  final _path = "api/books";
  final Map<String, String> _headers = {'Accept': 'application/json'};

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
}
