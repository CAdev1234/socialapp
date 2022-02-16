import 'package:get/get.dart';
import 'package:socialapp/pages/messenger/main_page/controller/main_page_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
  }
}