import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/services/authentication/auth_service.dart';
import 'package:share_a_book/services/database/database_service.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';
import 'package:share_a_book/ui/widgets/chatrooms_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatRoomViewModel extends ChangeNotifier {
  AuthService _authService = serviceLocator<AuthService>();
  DatabaseService _databaseService = serviceLocator<DatabaseService>();
  Stream chatRooms;

  AppUser user;

  getUserInfogetChats() async {
    Constants.myName = await getUserNameSharedPreference();
    _databaseService.getUserChats(Constants.myName).then((snapshots) {
      chatRooms = snapshots;
    });
    notifyListeners();
  }

  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static Future<String> getUserNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceUserNameKey);
  }

  Widget chatRoomsList() {
    user = _authService.currentUser;

    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatRoomsTile(
                    userName: snapshot.data.docs[index].id
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(user.fullName, ""),
                    chatRoomId: snapshot.data.docs[index].id,
                  );
                })
            : Container();
      },
    );
  }
}
