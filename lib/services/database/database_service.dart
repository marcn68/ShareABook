import 'package:share_a_book/business_logic/models/user.dart';

abstract class DatabaseService {
  Future initializeUserInDatabase({AppUser user});
  Future updateUserInDatabase({AppUser user});
  Future removeUserFromDatabase({String uid});
  Future getUserFromDatabase({String uid});

  //Messaging funtions
  Future getUserChats(String itIsMyName);
  Future<void> addMessage(String chatRoomId, chatMessageData);
  getChats(String chatRoomId);
  Future getMessages(String chatRoomId, String docId);
  Future<bool> addChatRoom(chatRoom, chatRoomId);
  Future getUserInfo(String email);
  Future<void> addUserInfo(userData);

  // void sendMessage(
  //   String convoID,
  //   String id,
  //   String pid,
  //   String content,
  //   String timestamp,
  // );
  // void updateMessageRead(DocumentSnapshot doc, String convoID);
  // void updateLastMessage(
  //     DocumentSnapshot doc, String uid, String pid, String convoID);
  // Stream<List<AppUser>> streamUsers();
  // Stream<List<Conversation>> streamConversations(String uid);
  //Stream<List<AppUser>> getUsersByList(List<String> userIds);
  //

}
