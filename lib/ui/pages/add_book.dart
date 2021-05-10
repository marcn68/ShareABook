import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/view_models/add_book_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/pages/add_book_detail.dart';
import 'package:share_a_book/ui/widgets/book_card_item.dart';

class AddBook extends StatefulWidget {
  AddBook({Key key}) : super(key: key);

  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  AddBookViewModel model = serviceLocator<AddBookViewModel>();
  TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookViewModel>(
        create: (context) => model,
        child: Consumer<AddBookViewModel>(
            builder: (context, model, child) => Scaffold(
                  backgroundColor: Constants.SECONDARY_BLUE,
                  appBar: AppBar(
                    title: Text(
                      "Add Book",
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
                    padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                style: TextStyle(fontSize: 14.0),
                                controller: _searchController,
                                decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Icon(
                                        Icons.search,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3.0,
                                            color: Constants.PRIMARY_ORANGE),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    labelStyle: TextStyle(fontSize: 14.0),
                                    labelText: "ISBN",
                                    hintText: "Example: 9780980200447",
                                    hintStyle: TextStyle(fontSize: 14.0)),
                                keyboardType: TextInputType.number,
                                onSubmitted: (isbn) {
                                  model.getBookInfo(isbn.toString());
                                },
                              ),
                            ),
                            //TextButton(onPressed: onPressed, child: child)
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        bookListView(model),
                      ],
                    ),
                  ),
                )));
  }

  Expanded bookListView(AddBookViewModel) {
    return Expanded(
      child: ListView.builder(
          itemCount: model.books.length,
          itemBuilder: (context, index) {
            return BookCardItem(model: model, index: index);
          }),
    );
  }
}
