import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:share_a_book/business_logic/models/book.dart';
import 'web_api.dart';

class WebApiImplementation implements WebApi {
  final _host = "openlibrary.org";
  final _path = "api/books";
  final Map<String, String> _headers = {'Accept': 'application/json'};

  var isbn = "ISBN:";
  List<Book> _books;

  @override
  Future<List<Book>> getBookById(jsonIsbn) async {
    isbn += jsonIsbn.toString();
    var queryParameters = {'bibkeys': isbn, 'jscmd': 'data', 'format': 'json'};
    final uri = Uri.https(_host, _path, queryParameters);
    var response = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(response.body);
    _books = _createBookList(jsonObject);
    return _books;
  }

  List<Book> _createBookList(Map jsonObject) {
    String isbn = jsonObject[this.isbn]["identifiers"]["isbn_10"]
        .toString()
        .substring(1, 10);
    String bookTitle = jsonObject[this.isbn]["title"].toString();

    List<String> authors = [];
    for (var author in jsonObject[this.isbn]["authors"]) {
      authors.add(author["name"].toString());
    }

    String numberOfPages;
    if (jsonObject[this.isbn]["number_of_pages"] == null) {
      numberOfPages = "No data found";
    } else {
      numberOfPages = jsonObject[this.isbn]["number_of_pages"].toString();
    }

    List<String> publishers = [];
    if (jsonObject[this.isbn]["publishers"] != null) {
      for (var publisher in jsonObject[this.isbn]["publishers"]) {
        publishers.add(publisher["name"].toString());
      }
    } else {
      publishers.add("No publishers");
    }

    String publishDate = jsonObject[this.isbn]["publish_date"].toString();

    List<String> subjects = [];
    for (var subject in jsonObject[this.isbn]["subjects"]) {
      subjects.add(subject["name"].toString());
    }

    String cover = jsonObject[this.isbn]["cover"]["medium"].toString();

    List<Book> list = [];
    list.add(Book(
        isbn = isbn,
        bookTitle = bookTitle,
        authors = authors,
        numberOfPages = numberOfPages,
        publishers = publishers,
        publishDate = publishDate,
        subjects = subjects,
        cover = cover));

    return list;
  }
}
