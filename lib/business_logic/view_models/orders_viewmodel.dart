import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/business_logic/models/order.dart';
import 'package:share_a_book/business_logic/models/user_book.dart';
import 'package:share_a_book/services/book/book_service.dart';
import 'package:share_a_book/services/order/order_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';

class OrdersViewModel extends ChangeNotifier {
  final OrderService _orderService = serviceLocator<OrderService>();

  List<Order> _orders = [];

  List<Order> get orders {
    return _orders;
  }

  Future getOrders() async {
  /*  Book book = Book(isbn: "0", title: "bookTitle", authors: ["authors"], publishDate: "21-5-2021", publishers: ["publishers"], subjects: ["subjects"], numberOfPages: "5",cover: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fb%2Fb6%2FImage_created_with_a_mobile_phone.png%2F1200px-Image_created_with_a_mobile_phone.png&imgrefurl=https%3A%2F%2Fsimple.wikipedia.org%2Fwiki%2FPicture&tbnid=gxFxsvFBmxeZ9M&vet=12ahUKEwi5_u_kuMbwAhVRQRoKHZw2DyoQMygAegUIARDSAQ..i&docid=BNDmYf01iceXQM&w=1200&h=900&q=image&ved=2ahUKEwi5_u_kuMbwAhVRQRoKHZw2DyoQMygAegUIARDSAQ" );
    Order order = Order(buyerId: "1234" , bookDocument: BookDocument(objectID: "1", userBook: UserBook(userId: "user111", book: book)));
    _orders.add(order);
    _orders.add(order);
    _orders.add(order);*/
    _orders = await _orderService.getOrders();
    notifyListeners();
  }
}
