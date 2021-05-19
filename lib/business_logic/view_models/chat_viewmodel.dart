import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/services/database/database_service.dart';
import 'package:share_a_book/services/service_locator.dart';

class ChatViewModel extends ChangeNotifier {
  final DatabaseService _databaseService = serviceLocator<DatabaseService>();

  String uid, convoID;
  AppUser contact;
  List<DocumentSnapshot> listMessage;
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();

  void onSendMessage(String content) {
    if (content.trim() != '') {
      textEditingController.clear();
      content = content.trim();
      _databaseService.sendMessage(convoID, uid, contact.uid, content,
          DateTime.now().millisecondsSinceEpoch.toString());
      listScrollController.animateTo(0.0,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  void updateMessageRead(doc, convoId) {
    _databaseService.updateMessageRead(doc, convoID);
  }
}
