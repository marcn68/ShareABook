import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/app/app.router.dart';
import 'package:share_a_book/business_logic/models/book_document.dart';
import 'package:share_a_book/business_logic/view_models/book_detail_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:stacked_services/stacked_services.dart';

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
    print(widget.bookDocument.userBook.userId);
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
                SizedBox(height: 15),
                Center(
                  child: Text(
                    widget.bookDocument.userBook.book.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "by ${widget.bookDocument.userBook.book.authors[0]}",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Center(
                  child: Text(
                    "First Published in ${widget.bookDocument.userBook.book.publishDate}",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Center(
                  child: Text(
                    "${widget.bookDocument.userBook.book.numberOfPages} Pages",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 1,
                  color: Color(0xff707070),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Price: ${widget.bookDocument.userBook.book.price}LL",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Text(
                        "Condition: ${widget.bookDocument.userBook.book.condition.toString().split(".")[1]}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Card(
                    child: ListTile(
                      onTap: () async {
                        await serviceLocator<NavigationService>().navigateTo(
                            Routes.userDetail,
                            arguments: UserDetailArguments(user: model.user));
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(50)),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey[800],
                            size: 40,
                          ),
                        ),
                      ),
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
