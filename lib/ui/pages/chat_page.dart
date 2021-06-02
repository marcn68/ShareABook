import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_a_book/business_logic/view_models/chat_viewmodel.dart';
import 'package:share_a_book/services/service_locator.dart';
import 'package:share_a_book/shared/constants.dart';

class Chat extends StatefulWidget {
  final String chatRoomId;

  Chat({this.chatRoomId});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ChatViewModel model = serviceLocator<ChatViewModel>();

  @override
  void initState() {
    model.messageEditingController = new TextEditingController();
    model.getChats(widget.chatRoomId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => model,
      child: Consumer<ChatViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Constants.SECONDARY_BLUE,
          appBar: AppBar(
            title: Text(
              "Chat",
              style: Constants.AppBarText,
            ),
            backgroundColor: Constants.PRIMARY_BLUE,
            centerTitle: false,
          ),
          body: Container(
            child: Stack(
              children: [
                model.chatMessages(widget.chatRoomId),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                    color: Constants.PRIMARY_BLUE,
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: model.messageEditingController,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          decoration: InputDecoration(
                              hintText: "Message ...",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              border: InputBorder.none),
                        )),
                        SizedBox(
                          width: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            model.addMessage(widget.chatRoomId);
                          },
                          child: Container(
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                Icons.send,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class Chat extends StatefulWidget {
//   const Chat(
//       {@required this.uid, @required this.contact, @required this.convoID});
//   final String uid, convoID;
//   final AppUser contact;
//   @override
//   _ChatState createState() => _ChatState();
// }

// class _ChatState extends State<Chat> {
//   final ChatViewModel model = serviceLocator<ChatViewModel>();

//   @override
//   void initState() {
//     super.initState();
//     model.uid = widget.uid;
//     model.convoID = widget.convoID;
//     model.contact = widget.contact;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ChatViewModel>(
//       create: (context) => model,
//       child: Consumer<ChatViewModel>(
//         builder: (context, model, child) => Scaffold(
//           backgroundColor: Constants.SECONDARY_BLUE,
//           appBar: AppBar(
//             automaticallyImplyLeading: true,
//             title: Text(
//               model.contact.fullName,
//               style: Constants.AppBarText,
//             ),
//             centerTitle: true,
//             backgroundColor: Constants.PRIMARY_BLUE,
//           ),
//           body: Container(
//             child: Stack(
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     buildMessages(),
//                     buildInput(),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildInput() {
//     return Container(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Row(
//             children: <Widget>[
//               // Edit text
//               Flexible(
//                 child: Container(
//                   child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: TextField(
//                         autofocus: true,
//                         maxLines: 5,
//                         controller: model.textEditingController,
//                         decoration: const InputDecoration.collapsed(
//                           hintText: 'Type your message...',
//                         ),
//                       )),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: IconButton(
//                   icon: Icon(Icons.send, size: 25),
//                   onPressed: () =>
//                       model.onSendMessage(model.textEditingController.text),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         width: double.infinity,
//         height: 100.0);
//   }

//   Widget buildMessages() {
//     return Flexible(
//       child: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('messages')
//             .doc(model.convoID)
//             .collection(model.convoID)
//             .orderBy('timestamp', descending: true)
//             .limit(20)
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasData) {
//             model.listMessage = snapshot.data.docs;
//             return ListView.builder(
//               padding: const EdgeInsets.all(10.0),
//               itemBuilder: (BuildContext context, int index) =>
//                   buildItem(index, snapshot.data.docs[index]),
//               itemCount: snapshot.data.docs.length,
//               reverse: true,
//               controller: model.listScrollController,
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }

//   Widget buildItem(int index, DocumentSnapshot document) {
//     if (!document['read'] && document['idTo'] == model.uid) {
//       model.updateMessageRead(document, model.convoID);
//     }

//     if (document['idFrom'] == model.uid) {
//       // Right (my message)
//       return Row(
//         children: <Widget>[
//           // Text
//           Container(
//               margin: EdgeInsets.symmetric(vertical: 5),
//               child: Bubble(
//                   color: Colors.blueGrey,
//                   elevation: 0,
//                   padding: const BubbleEdges.all(10.0),
//                   nip: BubbleNip.rightTop,
//                   child: Text(document['content'],
//                       style: TextStyle(color: Colors.white))),
//               width: 200)
//         ],
//         mainAxisAlignment: MainAxisAlignment.end,
//       );
//     } else {
//       // Left (peer message)
//       return Container(
//         margin: EdgeInsets.symmetric(vertical: 5),
//         child: Column(
//           children: <Widget>[
//             Row(children: <Widget>[
//               Container(
//                 child: Bubble(
//                     color: Colors.white10,
//                     elevation: 0,
//                     padding: const BubbleEdges.all(10.0),
//                     nip: BubbleNip.leftTop,
//                     child: Text(document['content'],
//                         style: TextStyle(color: Colors.white))),
//                 width: 200.0,
//                 margin: const EdgeInsets.only(left: 10.0),
//               )
//             ])
//           ],
//           crossAxisAlignment: CrossAxisAlignment.start,
//         ),
//       );
//     }
//   }
// }
