import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/business_logic/view_models/virtual_bookshelf_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/ui/widgets/book_card_item.dart';
import 'package:share_a_book/ui/widgets/book_list_view.dart';
import 'package:share_a_book/ui/widgets/custom_label.dart';

class VirtualBookshelfScreen extends StatefulWidget {
  @override
  _VirtualBookshelfScreenState createState() => _VirtualBookshelfScreenState();
}

class _VirtualBookshelfScreenState extends State<VirtualBookshelfScreen> {
  VirtualBookshelfViewModel virtualBookshelfModel =
      serviceLocator<VirtualBookshelfViewModel>();
  @override
  void initState() {
    super.initState();
    final user = Provider.of<AppUser>(context);
    virtualBookshelfModel.getLoggedInUserBooks(user.uid);
    /*virtualBookshelfModel.getLoggedInUserBooks("");*/
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VirtualBookshelfViewModel>(
        create: (context) => virtualBookshelfModel,
        child: Consumer<VirtualBookshelfViewModel>(
            builder: (context, model, child) => Scaffold(
                backgroundColor: Color(0xffDFEEF5),
                body: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Center(
                      child: Column(children: <Widget>[
                        SizedBox(height: 24),
                        CustomLabel(text: "My Books ", fontSize: 22.0),
                        SizedBox(height: 24),
                        BookListView(books: virtualBookshelfModel.books)
                      ]),
                    )) // This trailing comma makes auto-formatting nicer for build methods.
                )));
  }

  // Expanded virtualBookshelfListView(virtualBookshelfViewModel) {
  //   return Expanded(
  //     child: ListView.builder(
  //         itemCount: virtualBookshelfViewModel.books.length,
  //         itemBuilder: (context, index) {
  //           return BookCardItem(
  //               books: virtualBookshelfModel.books, index: index);
  //         }),
  //   );
  // }
}
