import 'package:flutter/material.dart';
import 'package:share_a_book/business_logic/view_models/add_book_viewmodel.dart';
import 'package:share_a_book/ui/pages/add_book_detail.dart';

class BookCardItem extends StatelessWidget {
  const BookCardItem({
    Key key,
    @required this.model,
    this.index,
  }) : super(key: key);

  final AddBookViewModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddBookDetail(book: model.books[index])),
        );
      },
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              child: Image.network(
                model.books[index].cover,
                scale: 1.20,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.books[index].bookTitle,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "by ${model.books[index].authors[0]}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "First Published in ${model.books[index].publishDate}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${model.books[index].numberOfPages} Pages",
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
