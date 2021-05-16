
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';

showAlertDialog() {


  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      serviceLocator<NavigationService>().back();
    },
  );

  // show the dialog
  showDialog(
/*
    context: context,
*/
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Invalid Password"),
        content: Text("Password does not match"),
        actions: [
          okButton,
        ],
      );
    },
  );

}