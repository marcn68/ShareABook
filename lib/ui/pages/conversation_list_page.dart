import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/models/conversation.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/business_logic/view_models/conversation_list_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/convo_list_item.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConversationList extends StatefulWidget {
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  final ConversationListViewModel model =
      serviceLocator<ConversationListViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final User firebaseUser = Provider.of<User>(context);
    final List<Conversation> _convos = Provider.of<List<Conversation>>(context);
    final List<AppUser> _users = Provider.of<List<AppUser>>(context);
    return ChangeNotifierProvider<ConversationListViewModel>(
      create: (context) => model,
      child: Consumer<ConversationListViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Constants.SECONDARY_BLUE,
          appBar: AppBar(
            title: Text(
              "Chats",
              style: Constants.AppBarText,
            ),
            centerTitle: true,
            backgroundColor: Constants.PRIMARY_BLUE,
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: getWidgets(context, firebaseUser, _convos, _users),
          ),
        ),
      ),
    );
  }

  Map<String, AppUser> getUserMap(List<AppUser> users) {
    final Map<String, AppUser> userMap = Map();
    for (AppUser u in users) {
      userMap[u.uid] = u;
    }
    return userMap;
  }

  List<Widget> getWidgets(BuildContext context, User user,
      List<Conversation> _convos, List<AppUser> _users) {
    final List<Widget> list = <Widget>[];
    if (_convos != null && _users != null && user != null) {
      final Map<String, AppUser> userMap = getUserMap(_users);
      for (Conversation c in _convos) {
        if (c.userIds[0] == user.uid) {
          list.add(ConvoListItem(
              user: user,
              peer: userMap[c.userIds[1]],
              lastMessage: c.lastMessage));
        } else {
          list.add(ConvoListItem(
              user: user,
              peer: userMap[c.userIds[0]],
              lastMessage: c.lastMessage));
        }
      }
    }

    return list;
  }
}
