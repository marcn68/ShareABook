import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/view_models/virtual_bookshelf_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/book_detail_list_view.dart';
import 'package:share_a_book/ui/widgets/drawer.dart';

class VirtualBookshelfScreen extends StatefulWidget {
  @override
  _VirtualBookshelfScreenState createState() => _VirtualBookshelfScreenState();
}

class _VirtualBookshelfScreenState extends State<VirtualBookshelfScreen> {
  VirtualBookshelfViewModel virtualBookshelfModel =
      serviceLocator<VirtualBookshelfViewModel>();
  @override
  void initState() {
    virtualBookshelfModel.getLoggedInUserBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VirtualBookshelfViewModel>(
        create: (context) => virtualBookshelfModel,
        child: Consumer<VirtualBookshelfViewModel>(
            builder: (context, model, child) => Scaffold(
                drawer: DrawerWidget(),
                backgroundColor: Constants.SECONDARY_BLUE,
                appBar: AppBar(
                  title: Text(
                    "My Books",
                    style: Constants.AppBarText,
                  ),
                  centerTitle: true,
                  backgroundColor: Constants.PRIMARY_BLUE,
                ),
                body: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Center(
                      child: Column(children: <Widget>[
                        //CustomLabel(text: "My Books ", fontSize: 22.0),
                        SizedBox(height: 24),
                        BookDetailListView(
                            bookDocuments: virtualBookshelfModel.bookDocument)
                      ]),
                    )) // This trailing comma makes auto-formatting nicer for build methods.
                )));
  }
}
