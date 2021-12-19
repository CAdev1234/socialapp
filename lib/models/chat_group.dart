import 'package:flutter/foundation.dart';

enum ChatGroupType {private, public}


class ChatGroup {
  
  ChatGroup({
    Key? key,
    required this.id,
    required this.groupName,
    required this.createdAt,
    required this.type,
    required this.isVerified,
  });

  String id;
  String groupName;
  String createdAt;
  ChatGroupType type;
  bool isVerified;

}

List demoGroups = [
  ChatGroup(
    id: '0',
    groupName: "Astro Boys",
    type: ChatGroupType.public,
    isVerified: true,
    createdAt: "12/12/2021",
  ),
  ChatGroup(
    id: '1',
    groupName: "Altsome",
    type: ChatGroupType.private,
    isVerified: false,
    createdAt: "12/12/2021",
  ),
  ChatGroup(
    id: '0',
    groupName: "Astro Boys",
    type: ChatGroupType.public,
    isVerified: true,
    createdAt: "12/12/2021",
  ),
  ChatGroup(
    id: '1',
    groupName: "Altsome",
    type: ChatGroupType.private,
    isVerified: false,
    createdAt: "12/12/2021",
  ),
  ChatGroup(
    id: '0',
    groupName: "Astro Boys",
    type: ChatGroupType.public,
    isVerified: true,
    createdAt: "12/12/2021",
  ),
  ChatGroup(
    id: '1',
    groupName: "Altsome",
    type: ChatGroupType.private,
    isVerified: false,
    createdAt: "12/12/2021",
  ),
];