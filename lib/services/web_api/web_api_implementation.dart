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
    // String body =
    //     '{"ISBN:9780980200447": {"url": "https://openlibrary.org/books/OL22853304M/Slow_reading", "key": "/books/OL22853304M", "title": "Slow reading", "authors": [{"url": "https://openlibrary.org/authors/OL6548935A/John_Miedema", "name": "John Miedema"}], "number_of_pages": 92, "pagination": "80p.", "weight": "1 grams", "by_statement": "by John Miedema.", "identifiers": {"amazon": ["098020044X"], "google": ["4LQU1YwhY6kC"], "librarything": ["8071257"], "goodreads": ["6383507"], "isbn_10": ["1936117363"], "isbn_13": ["9780980200447", "9781936117369"], "lccn": ["2008054742"], "oclc": ["297222669"], "openlibrary": ["OL22853304M"]}, "classifications": {"lc_classifications": ["Z1003 .M58 2009"], "dewey_decimal_class": ["028/.9"]}, "publishers": [{"name": "Litwin Books"}], "publish_places": [{"name": "Duluth, Minn"}], "publish_date": "March 2009", "subjects": [{"name": "Books and reading", "url": "https://openlibrary.org/subjects/books_and_reading"}, {"name": "Reading", "url": "https://openlibrary.org/subjects/reading"}], "notes": "Includes bibliographical references and index.", "table_of_contents": [{"level": 0, "label": "", "title": "The personal nature of slow reading", "pagenum": ""}, {"level": 0, "label": "", "title": "Slow reading in an information ecology", "pagenum": ""}, {"level": 0, "label": "", "title": "The slow movement and slow reading", "pagenum": ""}, {"level": 0, "label": "", "title": "The psychology of slow reading", "pagenum": ""}, {"level": 0, "label": "", "title": "The practice of slow reading.", "pagenum": ""}], "links": [{"title": "Author\'s Website", "url": "http://johnmiedema.ca"}, {"title": "Chapter 2", "url": "http://litwinbooks.com/slowreading-ch2.php"}, {"title": "Get the e-book", "url": "http://www.powells.com/biblio/91-9781936117369-0"}], "ebooks": [{"preview_url": "https://archive.org/details/slowreading00mied", "availability": "borrow", "formats": {}, "borrow_url": "https://openlibrary.org/books/OL22853304M/Slow_reading/borrow", "checkedout": false}], "cover": {"small": "https://covers.openlibrary.org/b/id/5546156-S.jpg", "medium": "https://covers.openlibrary.org/b/id/5546156-M.jpg", "large": "https://covers.openlibrary.org/b/id/5546156-L.jpg"}}}';
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
