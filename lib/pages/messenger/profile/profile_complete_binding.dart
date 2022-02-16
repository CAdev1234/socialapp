import 'package:get/get.dart';
import 'package:socialapp/pages/messenger/profile/controller/profile_complete_page_controller.dart';

class ProfileCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileCompletePageController>(() => ProfileCompletePageController());
  }
}