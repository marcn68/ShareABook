import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:share_a_book/business_logic/models/book.dart';
import 'web_api.dart';

class WebApiImplementation implements WebApi {
  final _host = "openlibrary.org";
  final _path = "api/books";
  final Map<String, String> _headers = {'Accept': 'application/json'};

  var isbn = "ISBN:";
  String isbnString;
  List<Book> _books;

  @override
  Future<List<Book>> getBookById(jsonIsbn) async {
    isbnString = isbn + jsonIsbn.toString();
    var queryParameters = {
      'bibkeys': isbnString,
      'jscmd': 'data',
      'format': 'json'
    };
    final uri = Uri.https(_host, _path, queryParameters);
    var response = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(response.body);
    _books = _createBookList(jsonObject);
    return _books;
  }

  List<Book> _createBookList(Map jsonObject) {
    String isbn;
    if (jsonObject[isbnString]["identifiers"]["isbn_10"] != null) {
      isbn = jsonObject[isbnString]["identifiers"]["isbn_10"]
          .toString()
          .substring(1, 10);
    } else {
      isbn = jsonObject[isbnString]["identifiers"]["isbn_13"]
          .toString()
          .substring(1, 13);
    }

    String title = jsonObject[isbnString]["title"].toString();

    List<String> authors = [];
    for (var author in jsonObject[isbnString]["authors"]) {
      authors.add(author["name"].toString());
    }

    String numberOfPages;
    if (jsonObject[isbnString]["number_of_pages"] == null) {
      numberOfPages = "No data found";
    } else {
      numberOfPages = jsonObject[isbnString]["number_of_pages"].toString();
    }

    List<String> publishers = [];
    if (jsonObject[isbnString]["publishers"] != null) {
      for (var publisher in jsonObject[isbnString]["publishers"]) {
        publishers.add(publisher["name"].toString());
      }
    } else {
      publishers.add("No publishers");
    }

    String publishDate = jsonObject[isbnString]["publish_date"].toString();

    List<String> subjects = [];
    if (jsonObject[isbnString]["subjects"] != null) {
      for (var subject in jsonObject[isbnString]["subjects"]) {
        subjects.add(subject["name"].toString());
      }
    } else {
      subjects.add("No subjects");
    }

    String cover = jsonObject[isbnString]["cover"]["medium"].toString();

    List<Book> list = [];
    list.add(Book(
        isbn: isbn,
        title: title,
        authors: authors,
        numberOfPages: numberOfPages,
        publishers: publishers,
        publishDate: publishDate,
        subjects: subjects,
        cover: cover));

    return list;
  }
}
