import 'package:flutter/material.dart';
import 'package:share_a_book/business_logic/models/order.dart';
import 'package:share_a_book/ui/widgets/order_card_item.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({
    Key key,
    @required this.orders,
  }) : super(key: key);

  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            return OrderCardItem(
              order: orders[index],
            );
          }),
    );
  }
}
