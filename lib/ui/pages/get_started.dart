import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/ui/widgets/button_style.dart';
import 'package:share_a_book/ui/widgets/label_style.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2395C8),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 177, 0, 0),
                  child: Icon(
                    Icons.book_online,
                    color: Colors.white,
                    size: 150,
                  ),
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                      width: 8,
                    ),
                    color: Color(0xffDFEEF5),
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(50.0)),
                  ),
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomLabelStyle(
                          "Get ready to lending and renting book in a creative way!"),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          height: 42.0,
                          child: CustomButtonStyle("GET STARTED")
                      ),
                    ],
                  ),
                ),
              ]),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

