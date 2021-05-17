import 'package:share_a_book/business_logic/models/order.dart';

abstract class OrderService {
  Future<List<Order>> getOrders();
}
