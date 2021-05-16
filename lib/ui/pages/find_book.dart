import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/view_models/find_book_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/book_detail_list_view.dart';

class FindBook extends StatefulWidget {
  @override
  _FindBookState createState() => _FindBookState();
}

class _FindBookState extends State<FindBook> {
  FindBookViewModel model = serviceLocator<FindBookViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FindBookViewModel>(
      create: (context) => model,
      child: Consumer<FindBookViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Constants.SECONDARY_BLUE,
          appBar: AppBar(
            title: Text(
              "Find a Book",
              style: Constants.AppBarText,
            ),
            centerTitle: true,
            backgroundColor: Constants.PRIMARY_BLUE,
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
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Icon(
                                  Icons.search,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3.0,
                                      color: Constants.PRIMARY_ORANGE),
                                  borderRadius: BorderRadius.circular(20.0)),
                              labelStyle: TextStyle(fontSize: 14.0),
                              labelText: "Search book",
                              hintText: "Example: Harry Potter",
                              hintStyle: TextStyle(fontSize: 14.0)),
                          keyboardType: TextInputType.number,
                          onSubmitted: (searchInput) {
                            model.searchInput = searchInput;
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                BookDetailListView(bookDocuments: model.bookDocuments),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
