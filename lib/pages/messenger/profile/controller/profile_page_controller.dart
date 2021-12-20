import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socialapp/constants.dart';

class ProfilePageController extends GetxController {
  String pageTitle = 'Profile';
  final getStorage = GetStorage();
  late String userEmail;

  @override
  void onInit() { // called immediately after the widget is allocated memory
    // fetchApi();
    userEmail = getStorage.read(cGSLoginedEmail);
    super.onInit();
  }
}