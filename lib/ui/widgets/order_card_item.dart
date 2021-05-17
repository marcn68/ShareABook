import 'package:flutter/material.dart';
import 'package:share_a_book/app/app.router.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/business_logic/models/order.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderCardItem extends StatelessWidget {
  const OrderCardItem({Key key, this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

      },
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 150,
              child: Image.network(
                order.bookDocument.userBook.book.cover,
                scale: 1.20,
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 250),
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    order.bookDocument.userBook.book.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    // overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "by ${order.bookDocument.userBook.book.authors[0]}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Buyer ID: ${order.buyerId}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Order Date: ${order.orderDate}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Price: ${order.bookDocument.userBook.book.price}LL",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
