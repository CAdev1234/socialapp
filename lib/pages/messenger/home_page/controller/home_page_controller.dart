import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/services/firebase_service.dart';

class HomePageController extends GetxController {
  final getStorage = GetStorage();
  

  signOutHandler() async {
    FirebaseService auth = FirebaseService();
    await auth.signOut();
    debugPrint(getStorage.read(cGSLoginedEmail));
    getStorage.remove(cGSLoginedEmail);
    Get.toNamed('/');
  }

}