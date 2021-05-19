import 'package:share_a_book/business_logic/models/user_book.dart';

class BookDocument {
  UserBook userBook;
  String objectID;

  BookDocument({this.userBook, this.objectID});

  BookDocument.fromJson(Map<String, dynamic> json) {
    userBook = json['userBook'] != null
        ? new UserBook.fromJson(json['userBook'])
        : null;
    objectID = json['objectID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userBook != null) {
      data['userBook'] = this.userBook.toJson();
    }
    data['objectID'] = this.objectID;
    return data;
  }
}