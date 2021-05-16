import 'book.dart';

class UserBook {
  Book book;
  String userId;

  UserBook({this.book, this.userId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book'] = this.book;
    data['userId'] = this.userId;
    return data;
  }
}
