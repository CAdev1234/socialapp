import 'package:get/get.dart';
import 'package:socialapp/pages/messenger/profile/controller/profile_page_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}