import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_a_book/business_logic/models/chat.dart';
import 'package:share_a_book/business_logic/models/conversation.dart';
import 'package:share_a_book/business_logic/models/user.dart';
import 'package:share_a_book/services/database/database_service.dart';

class DatabaseServiceFirestore implements DatabaseService {
  final _usersRef = FirebaseFirestore.instance.collection('users');
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override
  Future getUserFromDatabase({String uid}) async {
    return (await _usersRef.doc(uid).get()).data();
  }

  @override
  Future initializeUserInDatabase({AppUser user}) async {
    return await _usersRef.doc(user.uid).set({
      'fullName': user.fullName,
      'email': user.email,
      'provider': user.provider,
      'books': [],
    });
  }

  @override
  Future removeUserFromDatabase({String uid}) async {
    // TODO: Remove all the books selled by this user or soft delete them
    return await _usersRef.doc(uid).delete();
  }

  @override
  Future updateUserInDatabase({AppUser user}) async {
    return await _usersRef.doc(user.uid).set({
      'fullName': user.fullName,
      'email': user.email,
      'provider': user.provider,
    });
  }

  //Messaging Functions

  @override
  Future getUserChats(String itIsMyName) async {
    return await _db
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

  @override
  Future<void> addMessage(String chatRoomId, chatMessageData) async {
    await _db
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  @override
  getChats(String chatRoomId) {
    return _db
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .snapshots();
  }

  @override
  Future getMessages(String chatRoomId, String docId) {
    return _db
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .doc(docId)
        .get();
  }

  @override
  Future getUserInfo(String email) async {
    return await _db
        .collection("usersChat")
        .where("userEmail", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  @override
  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    _db.collection("chatRoom").doc(chatRoomId).set(chatRoom).catchError((e) {
      print(e);
    });
  }

  @override
  Future<void> addUserInfo(userData) async {
    _db.collection("usersChat").add(userData).catchError((e) {
      print(e.toString());
    });
  }

//
  // @override
  // Stream<List<Conversation>> streamConversations(String uid) {
  //   return _db
  //       .collection('messages')
  //       .orderBy('lastMessage.timestamp', descending: true)
  //       .where('users', arrayContains: uid)
  //       .snapshots()
  //       .map((QuerySnapshot list) => list.docs
  //           .map((DocumentSnapshot doc) => Conversation.fromFireStore(doc))
  //           .toList());
  // }

  // @override
  // void sendMessage(
  //   String convoID,
  //   String id,
  //   String pid,
  //   String content,
  //   String timestamp,
  // ) {
  //   final DocumentReference convoDoc =
  //       FirebaseFirestore.instance.collection('messages').doc(convoID);

  //   convoDoc.set(<String, dynamic>{
  //     'lastMessage': <String, dynamic>{
  //       'idFrom': id,
  //       'idTo': pid,
  //       'timestamp': timestamp,
  //       'content': content,
  //       'read': false
  //     },
  //     'users': <String>[id, pid]
  //   }).then((dynamic success) {
  //     final DocumentReference messageDoc = FirebaseFirestore.instance
  //         .collection('messages')
  //         .doc(convoID)
  //         .collection(convoID)
  //         .doc(timestamp);

  //     FirebaseFirestore.instance
  //         .runTransaction((Transaction transaction) async {
  //       await transaction.set(
  //         messageDoc,
  //         <String, dynamic>{
  //           'idFrom': id,
  //           'idTo': pid,
  //           'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
  //           'content': content,
  //           'read': false
  //         },
  //       );
  //     });
  //   });
  // }

  // @override
  // void updateMessageRead(DocumentSnapshot doc, String convoID) {
  //   final DocumentReference documentReference = FirebaseFirestore.instance
  //       .collection('messages')
  //       .doc(convoID)
  //       .collection(convoID)
  //       .doc(doc.id);

  //   documentReference.set(<String, dynamic>{'read': true});
  // }

  // void updateLastMessage(
  //     DocumentSnapshot doc, String uid, String pid, String convoID) {
  //   final DocumentReference documentReference =
  //       FirebaseFirestore.instance.collection('messages').doc(convoID);

  //   documentReference
  //       .set(<String, dynamic>{
  //         'lastMessage': <String, dynamic>{
  //           'idFrom': doc['idFrom'],
  //           'idTo': doc['idTo'],
  //           'timestamp': doc['timestamp'],
  //           'content': doc['content'],
  //           'read': doc['read']
  //         },
  //         'users': <String>[uid, pid]
  //       })
  //       .then((dynamic success) {})
  //       .catchError((dynamic error) {
  //         print(error);
  //       });
  // }

  // @override
  // Stream<List<AppUser>> streamUsers() {
  //   return _db
  //       .collection('users')
  //       .snapshots()
  //       .map((QuerySnapshot list) => list.docs
  //           .map((DocumentSnapshot snap) => AppUser.fromJson(snap.data()))
  //           .toList())
  //       .handleError((dynamic e) {
  //     print(e);
  //   });
  // }

  // @override
  // Stream<List<AppUser>> getUsersByList(List<String> userIds) {
  //   // final List<Stream<AppUser>> streams = [];
  //   // for (String id in userIds) {
  //   //   streams.add(_db
  //   //       .collection('users')
  //   //       .doc(id)
  //   //       .snapshots()
  //   //       .map((DocumentSnapshot snap) => AppUser.fromJson(snap.data())));
  //   // }
  //   // return StreamGroup.mergeBroadcast();
  // }
}
