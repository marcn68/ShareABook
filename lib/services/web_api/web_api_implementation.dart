import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:share_a_book/business_logic/models/book.dart';
import 'web_api.dart';

class WebApiImplementation implements WebApi {
  final _host = "openlibrary.org";
  final _path = "api/books";
  final Map<String, String> _headers = {'Accept': 'application/json'};

  var isbn = "ISBN:9781408855898";
  List<Book> _books;

  @override
  Future<List<Book>> getBookById() async {
    var queryParameters = {'bibkeys': isbn, 'jscmd': 'data', 'format': 'json'};
    final uri = Uri.https(_host, _path, queryParameters);
    var response = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(response.body);
    _books = _createBookList(jsonObject);
    print(jsonObject["ISBN:9781408855898"]["title"]);

    return _books;
  }

  List<Book> _createBookList(Map jsonObject) {
    String isbn = jsonObject["ISBN:9781408855898"]["identifiers"]["isbn_10"]
        .toString()
        .substring(1, 10);
    String bookTitle = jsonObject["ISBN:9781408855898"]["title"].toString();

    List<String> authors = [];
    for (var author in jsonObject["ISBN:9781408855898"]["authors"]) {
      authors.add(author["name"].toString());
    }

    int numberOfPages = jsonObject["ISBN:9781408855898"]["number_of_pages"];

    List<String> publishers = [];
    for (var publisher in jsonObject["ISBN:9781408855898"]["publishers"]) {
      publishers.add(publisher["name"].toString());
    }

    String publishDate =
        jsonObject["ISBN:9781408855898"]["publish_date"].toString();

    List<String> subjects = [];
    for (var subject in jsonObject["ISBN:9781408855898"]["subjects"]) {
      subjects.add(subject["name"].toString());
    }

    String cover =
        jsonObject["ISBN:9781408855898"]["cover"]["medium"].toString();

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
