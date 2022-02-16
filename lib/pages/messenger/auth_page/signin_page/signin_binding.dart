import 'package:get/get.dart';
import 'package:socialapp/pages/messenger/auth_page/signin_page/controller/signin_page_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInPageController>(() => SignInPageController());
  }
}