
enum ChatMessageType { text, audio, image, video }
enum MessageStatus { not_sent, pending, not_view, viewed, deleted }

class ChatMessage {
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    required this.text,
    required this.messageType,
    required this.messageStatus,
    required this.isSender
  });
}


List demoChatMessage = [
  ChatMessage(
    text: "Hi, User 1",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true
  ),
  ChatMessage(
    text: "Hello, User 2",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: true
  ),
  ChatMessage(
    text: "",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.not_view,
    isSender: true
  ),
];