import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/book.dart';

class FindBookViewModel extends ChangeNotifier {
  String searchInput;
  List<Book> _books = [];

  List<Book> get books {
    return _books;
  }

  void searchBookByTerm() {}
}
