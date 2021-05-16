import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';

class FindBookViewModel extends ChangeNotifier {
  String searchInput;
  List<BookDocument> _bookDocuments = [];

  List<BookDocument> get bookDocuments {
    return _bookDocuments;
  }

  void searchBookByTerm() {}
}
