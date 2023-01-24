enum MessageType { user, bot }

class MessageModel {
  String? text;
  MessageType? type;

  MessageModel({
    required this.text,
    required this.type,
  });
}
