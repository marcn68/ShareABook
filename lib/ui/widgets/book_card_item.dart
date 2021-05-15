import 'package:flutter/material.dart';
import 'package:share_a_book/app/app.router.dart';
import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/business_logic/view_models/add_book_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/ui/pages/add_book_detail.dart';
import 'package:stacked_services/stacked_services.dart';

class BookCardItem extends StatelessWidget {
  const BookCardItem({
    Key key,
    this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await serviceLocator<NavigationService>().navigateTo(
            Routes.addBookDetail,
            arguments: AddBookDetailArguments(book: book));
        // await Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => AddBookDetail(book: books[index])),
        // );
      },
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 150,
              child: Image.network(
                book.cover,
                scale: 1.20,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    book.bookTitle,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "by ${book.authors[0]}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "First Published in ${book.publishDate}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${book.numberOfPages} Pages",
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
