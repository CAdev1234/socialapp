import 'package:get/get.dart';
import 'package:socialapp/pages/messenger/home_page/controller/home_page_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}