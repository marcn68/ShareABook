import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/ui/widgets/custom_button.dart';
import 'package:share_a_book/ui/widgets/custom_label.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          child: Center(
            child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  CustomLabel(text: "Trending Genres", fontSize: 22.0),
                  SizedBox(height: 24),
                  SizedBox(
                    height: 100, // constrain height
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          color: Color(0xffFEBB47),
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          alignment: Alignment.center,
                          child: CustomLabel(text: "Fantazy", fontSize: 22.0),
                        ),
                        Container(
                          width: 100.0,
                          color: Color(0xffFEBB47),
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          alignment: Alignment.center,
                          child: CustomLabel(text: "Romance", fontSize: 22.0),
                        ),
                        Container(
                          width: 100.0,
                          color: Color(0xffFEBB47),
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          alignment: Alignment.center,
                          child: CustomLabel(text: "Comedy", fontSize: 22.0),
                        ),
                        Container(
                          width: 100.0,
                          color: Color(0xffFEBB47),
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          alignment: Alignment.center,
                          child: CustomLabel(text: "Litterary", fontSize: 22.0),
                        ),
                        Container(
                          width: 100.0,
                          color: Color(0xffFEBB47),
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          alignment: Alignment.center,
                          child: CustomLabel(text: "Fiction", fontSize: 22.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  CustomLabel(text: "Book of the Week ", fontSize: 22.0),
                ]),
          )
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
