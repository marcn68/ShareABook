import 'book.dart';

class UserBook {
  Book book;
  String userId;

  UserBook({this.book, this.userId});

  UserBook.fromJson(Map<String, dynamic> json) {
    book = json['book'] != null ? new Book.fromJson(json['book']) : null;
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.book != null) {
      data['book'] = this.book.toJson();
    }
    data['userId'] = this.userId;
    return data;
  }
}