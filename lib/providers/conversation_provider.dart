import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/models/conversation.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/services/database/database_service_firestore.dart';

class ConversationProvider extends StatelessWidget {
  const ConversationProvider({
    Key key,
    @required this.user,
  }) : super(key: key);

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Conversation>>.value(
        initialData: null,
        value: DatabaseServiceFirestore().streamConversations(user.uid),
        child: ConversationDetailsProvider(user: user));
  }
}

class ConversationDetailsProvider extends StatelessWidget {
  const ConversationDetailsProvider({
    Key key,
    @required this.user,
  }) : super(key: key);

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<AppUser>>.value(
      initialData: null,
      value: DatabaseServiceFirestore()
          .getUsersByList(getUserIds(Provider.of<List<Conversation>>(context))),
    );
  }

  List<String> getUserIds(List<Conversation> _convos) {
    final List<String> users = <String>[];
    if (_convos != null) {
      for (Conversation c in _convos) {
        c.userIds[0] != user.uid
            ? users.add(c.userIds[0])
            : users.add(c.userIds[1]);
      }
    }
    return users;
  }
}
