import 'package:get/get.dart';
import 'package:socialapp/pages/messenger/chat_room_page/controller/chat_room_page_controller.dart';

class ChatRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatRoomPageController>(() => ChatRoomPageController());
  }
}