import 'package:get/get.dart';
import 'package:socialapp/pages/messenger/profile/controller/profile_edit_page_controller.dart';

class ProfileEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditPageController>(() => ProfileEditPageController());
  }  
}