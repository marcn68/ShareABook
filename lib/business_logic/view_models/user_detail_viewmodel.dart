import 'package:flutter/foundation.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class UserDetailViewModel extends ChangeNotifier {
  List<String> emails = [];

  void sendEmail(context, emailRecipient) async {
    emails.add(emailRecipient);
    final Email email = Email(recipients: emails, isHTML: false);

    try {
      await FlutterEmailSender.send(email);
    } catch (e) {}
  }
}
