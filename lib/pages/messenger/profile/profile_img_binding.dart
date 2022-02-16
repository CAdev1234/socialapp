import 'package:get/get.dart';
import 'package:socialapp/pages/messenger/profile/controller/profile_image_page_controller.dart';

class ProfileImgBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileImagePageController>(() => ProfileImagePageController());
  }
}