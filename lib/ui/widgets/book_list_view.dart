import 'package:flutter/material.dart';
import 'package:share_a_book/business_logic/view_models/find_book_viewmodel.dart';

import 'book_card_item.dart';

class BookListView extends StatelessWidget {
  const BookListView({
    Key key,
    @required this.model,
  }) : super(key: key);

  final FindBookViewModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: model.books.length,
          itemBuilder: (context, index) {
            return BookCardItem(books: model.books, index: index);
          }),
    );
  }
}
