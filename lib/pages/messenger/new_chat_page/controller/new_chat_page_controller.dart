import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/services/firebase_service.dart';

class NewChatPageController extends GetxController {
  String pageTitle = "New Chat";
  List allContacts = [].obs;
  RxBool isLoading = true.obs;


  @override
  void onInit() async { // called immediately after the widget is allocated memory
    // fetchApi();
    isLoading.value = false;
    FirebaseService fbService = FirebaseService();
    debugPrint("newchatpage controller initialized");
    try {
      await fbService.getFBContacts().then((data) => {
        allContacts = data,
        debugPrint('data=${allContacts.length}'),
        isLoading.value = false
      });  
    } catch (e) {
      Get.defaultDialog(
        title: "Something Wrong!",
        content: Text(
          e.toString(),
          style: const TextStyle(fontSize: cFontSize12),
        ),
      );
    }
    super.onInit();
  }
}