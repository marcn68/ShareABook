import 'package:flutter/material.dart';
import 'package:share_a_book/business_logic/models/book.dart';

import 'book_card_item.dart';

class BookListView extends StatelessWidget {
  const BookListView({
    Key key,
    @required this.books,
    this.priceDisplay = false
  }) : super(key: key);

  final List<Book> books;
  final bool priceDisplay;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return BookCardItem(book: books[index], priceDisplay: priceDisplay);
          }),
    );
  }
}
