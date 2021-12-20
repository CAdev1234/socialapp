import 'package:get/get.dart';
import 'package:socialapp/services/firebase_service.dart';

class SignUpPageController extends GetxController {

  RxString email = ''.obs;
  RxString password = ''.obs;

  setEmailHandler(String str) {
    email.value = str;
  }

  setPasswordHandler(String str) {
    password.value = str;
  }

  signUpHandler() {
    FirebaseService auth = FirebaseService();
    auth.signUpWithEmailPassword(email.value, password.value);
  }
}