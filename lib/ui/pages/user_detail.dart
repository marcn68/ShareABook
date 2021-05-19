import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/app/app.router.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/business_logic/view_models/user_detail_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:stacked_services/stacked_services.dart';

class UserDetail extends StatefulWidget {
  AppUser user;
  UserDetail({Key key, this.user}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  UserDetailViewModel model = serviceLocator<UserDetailViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<AppUser>(context);
    return ChangeNotifierProvider<UserDetailViewModel>(
      create: (context) => model,
      child: Consumer<UserDetailViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Constants.SECONDARY_BLUE,
          appBar: AppBar(
            title: Text(
              "User Detail",
              style: Constants.AppBarText,
            ),
            centerTitle: true,
            backgroundColor: Constants.PRIMARY_BLUE,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.person,
                      color: Colors.grey[800],
                      size: 140,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    widget.user.fullName,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    widget.user.email,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: ElevatedButton(
                      child: Text(
                        "Send Email",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      onPressed: () =>
                          model.sendEmail(context, widget.user.email)),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                    child: Text(
                      "Chat",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    onPressed: () async {
                      String convoId = model.createConversation(
                          loggedUser.uid, widget.user.uid);
                      await serviceLocator<NavigationService>().navigateTo(
                          Routes.chat,
                          arguments: ChatArguments(
                              uid: loggedUser.uid,
                              contact: widget.user,
                              convoID: convoId));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
