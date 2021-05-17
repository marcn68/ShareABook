import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/view_models/home_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/book_detail_list_view.dart';
import 'package:share_a_book/ui/widgets/custom_label.dart';
import 'package:share_a_book/ui/widgets/trending_genres_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel popularBooksModel = serviceLocator<HomeViewModel>();
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
    popularBooksModel.getPopularBooks();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
        create: (context) => popularBooksModel,
        child: Consumer<HomeViewModel>(
            builder: (context, model, child) => Scaffold(
                backgroundColor: Constants.SECONDARY_BLUE,
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
                        CustomLabel(text: "Popular Books ", fontSize: 22.0),
                        SizedBox(height: 24),
                        BookDetailListView(
                            bookDocuments: popularBooksModel.bookDocuments)
                      ]),
                    )) // This trailing comma makes auto-formatting nicer for build methods.
                )));
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
