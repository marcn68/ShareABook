import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/view_models/chatrooms_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  ChatRoomViewModel model = serviceLocator<ChatRoomViewModel>();

  @override
  void initState() {
    model.getUserInfogetChats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => model,
      child: Consumer<ChatRoomViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Constants.SECONDARY_BLUE,
          appBar: AppBar(
            title: Text(
              "Chats",
              style: Constants.AppBarText,
            ),
            backgroundColor: Constants.PRIMARY_BLUE,
            centerTitle: false,
          ),
          body: Container(
            child: model.chatRoomsList(),
          ),
        ),
      ),
    );
  }
}
