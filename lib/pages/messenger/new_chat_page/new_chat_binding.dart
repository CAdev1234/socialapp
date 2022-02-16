import 'package:get/get.dart';
import 'package:socialapp/pages/messenger/new_chat_page/controller/new_chat_page_controller.dart';

class NewChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewChatPageController>(() => NewChatPageController());
  }
}