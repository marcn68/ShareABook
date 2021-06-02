import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/database/database_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/message_tile.dart';

class ChatViewModel extends ChangeNotifier {
  final DatabaseService _databaseService = serviceLocator<DatabaseService>();
  final AuthService _authService = serviceLocator<AuthService>();

  Stream<QuerySnapshot> chats;
  DocumentSnapshot snap;
  Map<String, dynamic> docData;
  TextEditingController messageEditingController;

  getChats(chatRoomId) {
    chats = _databaseService.getChats(chatRoomId);
    return chats;
  }

  void getMessages(chatRoomId, docId) async {
    snap = await _databaseService.getMessages(chatRoomId, docId);
    docData = snap.data();
    //return docData["message"];
  }

  addMessage(chatRoomId) {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": _authService.currentUser.fullName,
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
      };

      _databaseService.addMessage(chatRoomId, chatMessageMap);
      messageEditingController.text = "";
    }
    notifyListeners();
  }

  Widget chatMessages(chatRoomId) {
    return StreamBuilder(
      stream: getChats(chatRoomId),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  getMessages(chatRoomId, snapshot.data.docs[index].id);
                  return MessageTile(
                    message: docData["message"],
                    sendByMe: Constants.myName == snapshot.data.docs[index].id,
                  );
                })
            : Container();
      },
    );
  }

  // String uid, convoID;
  // AppUser contact;
  // List<DocumentSnapshot> listMessage;
  // final TextEditingController textEditingController = TextEditingController();
  // final ScrollController listScrollController = ScrollController();

  // void onSendMessage(String content) {
  //   if (content.trim() != '') {
  //     textEditingController.clear();
  //     content = content.trim();
  //     _databaseService.sendMessage(convoID, uid, contact.uid, content,
  //         DateTime.now().millisecondsSinceEpoch.toString());
  //     listScrollController.animateTo(0.0,
  //         duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  //   }
  // }

  // void updateMessageRead(doc, convoId) {
  //   _databaseService.updateMessageRead(doc, convoID);
  // }
}
