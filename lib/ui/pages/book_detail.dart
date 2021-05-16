import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/business_logic/view_models/add_book_viewmodel.dart';
import 'package:share_a_book/business_logic/view_models/book_detail_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';

// ignore: must_be_immutable
class BookDetail extends StatefulWidget {
  BookDocument bookDocument;
  BookDetail({Key key, this.bookDocument}) : super(key: key);

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  BookDetailViewModel model = serviceLocator<BookDetailViewModel>();

  @override
  void initState() {
    model.getUserFromDatabase(widget.bookDocument.userBook.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookDetailViewModel>(
      create: (context) => model,
      child: Consumer<BookDetailViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Constants.SECONDARY_BLUE,
          appBar: AppBar(
            title: Text(
              "Book Detail",
              style: Constants.AppBarText,
            ),
            centerTitle: true,
            backgroundColor: Constants.PRIMARY_BLUE,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.network(widget.bookDocument.userBook.book.cover,
                      scale: 1.2),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    widget.bookDocument.userBook.book.bookTitle,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "by ${widget.bookDocument.userBook.book.authors[0]}",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Center(
                  child: Text(
                    "First Published in ${widget.bookDocument.userBook.book.publishDate}",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Center(
                  child: Text(
                    "${widget.bookDocument.userBook.book.numberOfPages} Pages",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(
                  height: 1,
                  color: Color(0xff707070),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Price: ${widget.bookDocument.userBook.book.price}LL",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        "Price: ${widget.bookDocument.userBook.book.condition.toString().split(".")[1]}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      "${model.user.fullName}",
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      "${model.user.email}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    child: Text(
                      "Buy Book",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
