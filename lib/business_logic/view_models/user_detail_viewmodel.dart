import 'package:flutter/foundation.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:share_a_book/services/chat/chat_service.dart';
import 'package:share_a_book/services/service_locator.dart';

class UserDetailViewModel extends ChangeNotifier {
  final ChatService _chatService = serviceLocator<ChatService>();
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
}
