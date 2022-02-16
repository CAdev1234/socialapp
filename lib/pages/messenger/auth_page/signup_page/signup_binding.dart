import 'package:get/get.dart';
import 'package:socialapp/pages/messenger/auth_page/signup_page/controller/signup_page_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpPageController>(() => SignUpPageController());
  }
}