import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/view_models/home_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/ui/widgets/book_card_item.dart';
import 'package:share_a_book/ui/widgets/custom_label.dart';
import 'package:share_a_book/ui/widgets/trending_genres_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel bookOfTheWeekModel = serviceLocator<HomeViewModel>();
  List<String> trendingGenres = [
    "Fantasy",
    "Romance",
    "Comedy",
    "Litterary",
    "Fiction"
  ];

  @override
  void initState() {
    super.initState();
    bookOfTheWeekModel.getBookOfTheWeekBooks();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
        create: (context) => bookOfTheWeekModel,
        child: Consumer<HomeViewModel>(
            builder: (context, model, child) => Scaffold(
                backgroundColor: Color(0xffDFEEF5),
                body: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Center(
                      child: Column(children: <Widget>[
                        SizedBox(height: 24),
                        CustomLabel(text: "Trending Genres", fontSize: 22.0),
                        SizedBox(height: 24),
                        SizedBox(
                            height: 100, // constrain height
                            child: trendingGenresView(trendingGenres)),
                        SizedBox(height: 24),
                        CustomLabel(text: "Book of the Week ", fontSize: 22.0),
                        SizedBox(height: 24),
                        bookOfTheWeekListView(bookOfTheWeekModel)
                      ]),
                    )) // This trailing comma makes auto-formatting nicer for build methods.
                )));
  }

  Expanded bookOfTheWeekListView(bookOfTheWeekViewModel) {
    return Expanded(
      child: ListView.builder(
          itemCount: bookOfTheWeekViewModel.books.length,
          itemBuilder: (context, index) {
            return BookCardItem(books: bookOfTheWeekModel.books, index: index);
          }),
    );
  }

  ListView trendingGenresView(trendingGenres) {
    return ListView.builder(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        itemCount: trendingGenres.length,
        itemBuilder: (context, index) {
          return TrendingGenresItem(
              trendingGenres: trendingGenres, index: index);
        });
  }
}
