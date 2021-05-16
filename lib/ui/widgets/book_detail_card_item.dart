import 'package:flutter/material.dart';
import 'package:share_a_book/app/app.router.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';

class BookDetailCardItem extends StatelessWidget {
  const BookDetailCardItem({Key key, this.bookDocument}) : super(key: key);

  final BookDocument bookDocument;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await serviceLocator<NavigationService>().navigateTo(Routes.bookDetail,
            arguments: BookDetailArguments(bookDocument: bookDocument));
      },
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 150,
              child: Image.network(
                bookDocument.userBook.book.cover,
                scale: 1.20,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    bookDocument.userBook.book.bookTitle,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "by ${bookDocument.userBook.book.authors[0]}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "First Published in ${bookDocument.userBook.book.publishDate}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${bookDocument.userBook.book.numberOfPages} Pages",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Price: ${bookDocument.userBook.book.price}LL",
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
