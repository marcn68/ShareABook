import 'package:share_a_book/business_logic/models/user_book.dart';

class BookDocument {
  String objectID;
  UserBook userBook;

  BookDocument({this.objectID, this.userBook});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectID'] = this.objectID;
    data['userBook'] = this.userBook;
    return data;
  }
}
