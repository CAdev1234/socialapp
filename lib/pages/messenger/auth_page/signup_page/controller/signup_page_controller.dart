import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socialapp/services/firebase_service.dart';

class SignUpPageController extends GetxController {
  RxString firstname = ''.obs;
  RxString lastname = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;

  setFirstNameHandler(String str) {
    firstname.value = str;
  }

  setLastNameHandler(String str) {
    lastname.value = str;
  }
  
  setEmailHandler(String str) {
    email.value = str;
  }

  setPasswordHandler(String str) {
    password.value = str;
  }

  signUpHandler() {
    FirebaseService auth = FirebaseService();
    auth.signUpFBWithEmailPassword(firstname.value, lastname.value, email.value, password.value);
  }
}