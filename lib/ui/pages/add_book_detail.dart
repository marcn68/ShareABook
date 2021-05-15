import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/models/book.dart';
import 'package:share_a_book/business_logic/view_models/add_book_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/condition_dropdown.dart';

// ignore: must_be_immutable
class AddBookDetail extends StatefulWidget {
  Book book;
  AddBookDetail({Key key, this.book}) : super(key: key);

  @override
  _AddBookDetailState createState() => _AddBookDetailState();
}

class _AddBookDetailState extends State<AddBookDetail> {
  AddBookViewModel model = serviceLocator<AddBookViewModel>();

  @override
  void initState() {
    model.priceController = TextEditingController();
    super.initState();
  }

  void updateCondition(Condition condition) {
    setState(() {
      model.condition = condition;
    });
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
                  child: Image.network(widget.book.cover, scale: 1.2),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    widget.book.bookTitle,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "by ${widget.book.authors[0]}",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Center(
                  child: Text(
                    "First Published in ${widget.book.publishDate}",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Center(
                  child: Text(
                    "${widget.book.numberOfPages} Pages",
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
                Text(
                  "Selling Price",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 14.0),
                    controller: model.priceController,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Icon(
                          Icons.monetization_on_outlined,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3.0, color: Constants.PRIMARY_ORANGE),
                          borderRadius: BorderRadius.circular(20.0)),
                      labelStyle: TextStyle(fontSize: 14.0),
                      labelText: "Price",
                      hintText: "Example: 20000LL",
                      hintStyle: TextStyle(fontSize: 14.0),
                      helperText: "All prices are in Lebanese Pound",
                      helperStyle: TextStyle(fontSize: 10.0),
                    ),
                    keyboardType: TextInputType.number,
                    //onSubmitted: () {},
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Book Condition",
                  style: TextStyle(fontSize: 16),
                ),
                ConditionDropDown(
                  updateCondition: updateCondition,
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: ElevatedButton(
                    child: Text(
                      "ADD BOOK",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    onPressed: () {
                      model.sendBookInfo(
                        widget.book,
                      );
                    },
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
