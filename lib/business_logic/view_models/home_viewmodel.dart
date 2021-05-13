import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';

class HomeViewModel extends ChangeNotifier {
  BackendApi _backendApi = serviceLocator<BackendApi>();

  List<Book> _books = [];

  List<Book> get books {
    return _books;
  }

  bool response;
  String msg;

  Future getBookOfTheWeekBooks() async {
 /*   Book book = Book("0", "bookTitle", ["authors"], "23", ["publishers"], "21-5-2021", ["subjects"], "https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fb%2Fb6%2FImage_created_with_a_mobile_phone.png%2F1200px-Image_created_with_a_mobile_phone.png&imgrefurl=https%3A%2F%2Fsimple.wikipedia.org%2Fwiki%2FPicture&tbnid=gxFxsvFBmxeZ9M&vet=12ahUKEwi5_u_kuMbwAhVRQRoKHZw2DyoQMygAegUIARDSAQ..i&docid=BNDmYf01iceXQM&w=1200&h=900&q=image&ved=2ahUKEwi5_u_kuMbwAhVRQRoKHZw2DyoQMygAegUIARDSAQ");
    _books.add(book);
    _books.add(book);
    _books.add(book);*/

    _books = await _backendApi.getBooksOfTheWeek();
    notifyListeners();
  }
}
