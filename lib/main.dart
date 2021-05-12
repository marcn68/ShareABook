import 'package:flutter/material.dart';
import 'package:share_a_book/ui/pages/about_us.dart';
import 'package:share_a_book/ui/pages/get_started.dart';
import 'package:share_a_book/ui/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShareABook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    /*  home: GetStartedScreen(),*/
      home: HomeScreen()
    );
  }
}
