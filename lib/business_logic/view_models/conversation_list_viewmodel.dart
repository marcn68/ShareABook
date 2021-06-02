import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/business_logic/models/conversation.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/services/database/database_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/ui/widgets/convo_list_item.dart';

class ConversationListViewModel extends ChangeNotifier {
  final DatabaseService _databaseService = serviceLocator<DatabaseService>();

  //Stream<List<Conversation>> convos;

  Map<String, AppUser> getUserMap(List<AppUser> users) {
    final Map<String, AppUser> userMap = Map();
    for (AppUser u in users) {
      userMap[u.uid] = u;
    }
    return userMap;
  }

  List<Widget> getWidgets(
      {BuildContext context,
      AppUser user,
      List<Conversation> convos,
      List<AppUser> users}) {
    final List<Widget> list = <Widget>[];
    if (convos != null && users != null && user != null) {
      final Map<String, AppUser> userMap = getUserMap(users);
      for (Conversation c in convos) {
        if (c.userIds[0] == user.uid) {
          list.add(ConvoListItem(
              appUser: user,
              peer: userMap[c.userIds[1]],
              lastMessage: c.lastMessage));
        } else {
          list.add(ConvoListItem(
              appUser: user,
              peer: userMap[c.userIds[0]],
              lastMessage: c.lastMessage));
        }
      }
    }
    return list;
  }

  // Stream<List<Conversation>> streamConversations(uid) {
  //   return _databaseService.streamConversations(uid);
  // }

  // Stream<List<AppUser>> streamUsers() {
  //   return _databaseService.streamUsers();
  // }
}
