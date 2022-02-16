
enum ChatMessageType { text, audio, image, video }
enum MessageStatus { notSent, pending, notView, viewed, deleted }
enum MessageActionStatus { none, copied, marked, replied, forwarded, deleted }

class ChatMessage {
  String userId;
  String text;
  String receiverId;
  ChatMessageType messageType;
  MessageStatus messageStatus;
  MessageActionStatus messageActionStatus;
  bool isMine;
  String createdAt;

  ChatMessage({
    required this.userId,
    required this.receiverId,
    required this.text,
    required this.messageType,
    required this.messageStatus,
    required this.messageActionStatus,
    required this.isMine,
    required this.createdAt
  });

  void setText(String text) {
    this.text = text;
  }
  
}


List demoChatMessage = [
  ChatMessage(
    userId: '0',
    receiverId: '1',
    text: "Hello John",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.none,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '1',
    receiverId: '1',
    text: "Hey, Jillian",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.none,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '2',
    receiverId: '1',
    text: "I'm doing great, thanks",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.none,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '3',
    receiverId: '1',
    text: "I'm doing good, thank you",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.none,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '4',
    receiverId: '1',
    text: "Lorem ipsum dolor sit amet.",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.none,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '5',
    receiverId: '1',
    text: "Hey, Jillian",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.none,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '6',
    receiverId: '1',
    text: "I'm doing great, thanks",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.none,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '7',
    receiverId: '1',
    text: "Hey, Jillian",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.none,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '8',
    receiverId: '1',
    text: "I'm doing great, thanks",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.none,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '9',
    receiverId: '1',
    text: "I'm doing good, thank you",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.none,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '10',
    receiverId: '1',
    text: "Lorem ipsum dolor sit amet.",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.none,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '11',
    receiverId: '1',
    text: "I'm doing good, thank you",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.none,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '12',
    receiverId: '1',
    text: "Lorem ipsum dolor sit amet.",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.none,
    isMine: true,
    createdAt: '04:15 PM'
  ),
];