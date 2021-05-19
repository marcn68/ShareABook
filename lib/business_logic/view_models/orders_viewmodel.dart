import 'package:flutter/foundation.dart';
import 'package:share_a_book/business_logic/models/order.dart';
import 'package:share_a_book/services/order/order_service.dart';
import 'package:share_a_book/services/service_locator.dart';

class OrdersViewModel extends ChangeNotifier {
  final OrderService _orderService = serviceLocator<OrderService>();

  List<Order> _orders = [];

  List<Order> get orders {
    return _orders;
  }

  Future getOrders() async {
    _orders = await _orderService.getOrders();
    notifyListeners();
  }
}
