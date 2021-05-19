import 'package:share_a_book/services/chat/chat_service.dart';

class ChatServiceImplementation extends ChatService {
  @override
  String getConversationId(userId, peerId) {
    return userId.hashCode <= peerId.hashCode
        ? userId + '_' + peerId
        : peerId + '_' + userId;
  }
}
