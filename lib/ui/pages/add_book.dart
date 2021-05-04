import 'package:flutter/material.dart';
import 'package:share_a_book/shared/constants.dart';

void main() => runApp(AddBook());

class AddBook extends StatefulWidget {
  AddBook({Key key}) : super(key: key);

  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
        child: Container(),
      ),
    );
  }
}
