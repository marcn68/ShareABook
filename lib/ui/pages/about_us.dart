import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/ui/widgets/custom_button.dart';
import 'package:share_a_book/ui/widgets/custom_label.dart';


class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDFEEF5),
        body: Padding(
           padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 50),
                  child: Icon(
                    Icons.book_online,
                    color: Colors.white,
                    size: 150,
                  ),
                ),
                CustomLabel(text: "Buying a book from a library nowadays is getting expensive day after days. And books aren't anymore accessible to all citizens, which is decreasing education. And also books bought by people, are most of the time sitting in a cabinet and untouched.", fontSize: 22.0),
                SizedBox(height: 50),
                CustomLabel(text: "This Platform will help book owners to share their used books for a fraction of the price to other users on the platform.", fontSize: 22.0),
              ]),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
