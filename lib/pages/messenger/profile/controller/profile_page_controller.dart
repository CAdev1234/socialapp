import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePageController extends GetxController {
  String pageTitle = 'Profile';
  final box = GetStorage();
  late String userEmail;

  @override
  void onInit() { // called immediately after the widget is allocated memory
    // fetchApi();
    userEmail = box.read('email');
    super.onInit();
  }
}