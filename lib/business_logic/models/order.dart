import 'book_document.dart';

class Order {
  BookDocument bookDocument;
  String buyerId;
  String orderDate;

  Order({this.bookDocument, this.buyerId, this.orderDate});

  Order.fromJson(Map<String, dynamic> json) {
    bookDocument = json['bookDocument'] != null
        ? new BookDocument.fromJson(json['bookDocument'])
        : null;
    buyerId = json['buyerId'];
    orderDate = json['orderDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bookDocument != null) {
      data['bookDocument'] = this.bookDocument.toJson();
    }
    data['buyerId'] = this.buyerId;
    data['orderDate'] = this.orderDate;
    return data;
  }
}