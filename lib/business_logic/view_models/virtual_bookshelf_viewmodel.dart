import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';

class VirtualBookshelfViewModel extends ChangeNotifier {
  BackendApi _backendApi = serviceLocator<BackendApi>();

  List<BookDocument> _bookDocuments = [];

  List<BookDocument> get bookDocument {
    return _bookDocuments;
  }

  Future getLoggedInUserBooks() async {
    _bookDocuments = await _backendApi.getLoggedInUserBooks();
    notifyListeners();
  }
}
