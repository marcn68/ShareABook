import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/custom_button.dart';
import 'package:share_a_book/ui/widgets/custom_label.dart';

import 'login.dart';

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
        backgroundColor: Constants.PRIMARY_BLUE,
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
                    color: Constants.SECONDARY_BLUE,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50.0)),
                  ),
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomLabel(
                          text:
                              "Get ready to lending and renting book in a creative way!",
                          fontSize: 18.0),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          height: 42.0,
                          child: CustomButton(
                              text: "GET STARTED", onPressed: navigateToLogin)),
                    ],
                  ),
                ),
              ]),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  /*Functions*/
  void navigateToLogin() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
