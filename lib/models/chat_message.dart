
enum ChatMessageType { text, audio, image, video }
enum MessageStatus { notSent, pending, notView, viewed, deleted }
enum MessageActionStatus { none, copied, marked, replied, forwarded, deleted }

class ChatMessage {
  final String userId;
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final MessageActionStatus messageActionStatus;
  final bool isMine;
  String createdAt;

  ChatMessage({
    required this.userId,
    required this.text,
    required this.messageType,
    required this.messageStatus,
    required this.messageActionStatus,
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
    messageActionStatus: MessageActionStatus.none,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '1',
    text: "Hey, Jillian",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.replied,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '2',
    text: "I'm doing great, thanks",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.forwarded,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '3',
    text: "I'm doing good, thank you",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.marked,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '4',
    text: "Lorem ipsum dolor sit amet.",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.deleted,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '5',
    text: "Hey, Jillian",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.none,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '6',
    text: "I'm doing great, thanks",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.marked,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '7',
    text: "Hey, Jillian",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.replied,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '8',
    text: "I'm doing great, thanks",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.notView,
    messageActionStatus: MessageActionStatus.forwarded,
    isMine: false,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '9',
    text: "I'm doing good, thank you",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.deleted,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '10',
    text: "Lorem ipsum dolor sit amet.",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.none,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '11',
    text: "I'm doing good, thank you",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.none,
    isMine: true,
    createdAt: '04:15 PM'
  ),
  ChatMessage(
    userId: '12',
    text: "Lorem ipsum dolor sit amet.",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    messageActionStatus: MessageActionStatus.none,
    isMine: true,
    createdAt: '04:15 PM'
  ),
];