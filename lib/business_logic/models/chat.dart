class Chat {
  String message;
  String sendBy;
  String time;

  Chat.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sendBy = json['sendBy'];
    time = json['time'];
  }
}
