import 'package:flutter/material.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'book_detail_card_item.dart';

class BookDetailListView extends StatelessWidget {
  const BookDetailListView({
    Key key,
    @required this.bookDocuments,
  }) : super(key: key);

  final List<BookDocument> bookDocuments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: bookDocuments.length,
          itemBuilder: (context, index) {
            return BookDetailCardItem(
              bookDocument: bookDocuments[index],
            );
          }),
    );
  }
}
