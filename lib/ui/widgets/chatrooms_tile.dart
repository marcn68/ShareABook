import 'package:flutter/material.dart';
import 'package:share_a_book/app/app.router.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({this.userName, @required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await serviceLocator<NavigationService>().navigateTo(Routes.chat,
            arguments: ChatArguments(chatRoomId: chatRoomId));
      },
      child: Container(
        child: ListTile(
          tileColor: Colors.white,
          title: Text(
            userName,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}
