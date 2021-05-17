import 'package:algolia/algolia.dart';
import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/business_logic/models/order.dart';
import 'package:share_a_book/services/order/order_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';
import 'package:share_a_book/services/web_api/web_api.dart';

import '../../main.dart';

class OrderServiceImplementation implements OrderService {
  BackendApi _backendApi = serviceLocator<BackendApi>();

  List<Order> orders = [];

  @override
  Future<List<Order>> getOrders() async {
    orders = await _backendApi.getOrders();
    return orders;
  }
}
