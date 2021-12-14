
enum ChatMessageType { text, audio, image, video }
enum MessageStatus { not_sent, pending, not_view, viewed, deleted }

class ChatMessage {
  final String userId;
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isMine;
  String createdAt;

  ChatMessage({
    required this.userId,
    required this.text,
    required this.messageType,
    required this.messageStatus,
    required this.isMine,
    required this.createdAt
  });
}


List demoChatMessage = [
  ChatMessage(
    userId: '0',
    text: "Hello John",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '1',
    text: "Hey, Jillian",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.not_view,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '2',
    text: "I'm doing great, thanks",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.not_view,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '3',
    text: "I'm doing good, thank you",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '4',
    text: "Lorem ipsum dolor sit amet.",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isMine: true,
    createdAt: '04:15 PM'
  ),
];