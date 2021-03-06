import 'package:share_a_book/business_logic/models/order.dart';
import 'package:share_a_book/services/order/order_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/services/web_api/backend_api.dart';

class OrderServiceImplementation implements OrderService {
  BackendApi _backendApi = serviceLocator<BackendApi>();

  List<Order> orders = [];

  @override
  Future<List<Order>> getOrders() async {
    orders = await _backendApi.getOrders();
    return orders;
  }
}
