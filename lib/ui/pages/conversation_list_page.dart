import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/models/conversation.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/business_logic/view_models/conversation_list_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/drawer.dart';

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
    final AppUser appUser = Provider.of<AppUser>(context);
    final List<Conversation> _convos = Provider.of<List<Conversation>>(context);
    final List<AppUser> _users = Provider.of<List<AppUser>>(context);
    return ChangeNotifierProvider<ConversationListViewModel>(
      create: (context) => model,
      child: Consumer<ConversationListViewModel>(
        builder: (context, model, child) => Scaffold(
          drawer: DrawerWidget(),
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
            children: model.getWidgets(
              context: context,
              user: appUser,
              convos: _convos,
              users: _users,
            ),
          ),
        ),
      ),
    );
  }
}

class ConversationsWrapper extends StatefulWidget {
  @override
  _ConversationsWrapperState createState() => _ConversationsWrapperState();
}

class _ConversationsWrapperState extends State<ConversationsWrapper> {
  final ConversationListViewModel model =
      serviceLocator<ConversationListViewModel>();

  @override
  Widget build(BuildContext context) {
    final AppUser user = Provider.of<AppUser>(context);
    return MultiProvider(
      providers: [
        // StreamProvider<List<Conversation>>.value(
        //   initialData: null,
        //   value: model.streamConversations(user.uid),
        // ),
        // StreamProvider<List<AppUser>>.value(
        //   initialData: null,
        //   value: model.streamUsers(),
        // ),
      ],
      child: ConversationList(),
    );
  }
}
