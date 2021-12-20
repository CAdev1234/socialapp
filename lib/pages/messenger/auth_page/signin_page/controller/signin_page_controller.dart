import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/services/firebase_service.dart';

class SignInPageController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;


  setEmailHandler(String str) {
    email.value = str;
  }

  setPasswordHandler(String str) {
    password.value = str;
  }

  signInHandler(BuildContext context) async {
    try {
      FirebaseService auth = FirebaseService();
      auth.signInWithEmailPassword(email.value, password.value);
      final box = GetStorage();
      box.write('email', email.value);
      Get.toNamed('/messenger/home_page');
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        content: Text(
          e.toString(),
          style: const TextStyle(fontSize: cFontSize12),
        ),
      );
    }
    

  }
}