import 'package:flutter/foundation.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:share_a_book/services/chat/chat_service.dart';
import 'package:share_a_book/services/database/database_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';

class UserDetailViewModel extends ChangeNotifier {
  final ChatService _chatService = serviceLocator<ChatService>();
  final DatabaseService _databaseService = serviceLocator<DatabaseService>();
  List<String> emails = [];

  void sendEmail(context, emailRecipient) async {
    emails.add(emailRecipient);
    final Email email = Email(recipients: emails, isHTML: false);

    try {
      await FlutterEmailSender.send(email);
    } catch (e) {}
  }

  String createConversation(uid, id) {
    String convoId = _chatService.getConversationId(uid, id);
    return convoId;
  }

  // String getChatRoomId(name) {
  //   return _chatService.getChatRoomId(Constants.myName, name);
  // }

  String createChatRoom(loggedusername, name) {
    List<String> users = [loggedusername, name];

    String chatRoomId = _chatService.getChatRoomId(loggedusername, name);

    Map<String, dynamic> chatRoom = {
      "users": users,
      "chatRoomId": chatRoomId,
    };

    _databaseService.addChatRoom(chatRoom, chatRoomId);
    return chatRoomId;
  }
}
