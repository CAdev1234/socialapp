import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/components/animation/custom_popup_route.dart';
import 'package:socialapp/models/contact.dart';
import 'package:socialapp/models/transition_type.dart';
import 'package:socialapp/pages/messenger/chat_room_page/components/msg_type_popup.dart';

class ChatRoomPageController extends GetxController {
  
  List categoryList = ["All", "Saved", "Media"];
  RxInt categoryIdx = 0.obs;

  RxBool enableChatInputFocus = false.obs;
  RxBool enableRecord = false.obs;

  late Contact clientContact;

  Future httpGet(String url) {
    return Future.delayed(const Duration(seconds: 3), () {
    });
  }

  selectCategoryHandler(int idx) {
    categoryIdx.value = idx;
  }


  focusChatInputHandler(bool value) {
    enableChatInputFocus.value = value;
  }

  createRecordHandler(bool value) {
    enableRecord.value = value;
  }

  openMsgTypePopupHandler(context) {
    Navigator.of(context).push(
      CustomPopupRoute(
        builder: (context) {
          return const MsgTypePopupBody();
        }, 
        dismissible: false, 
        color: Colors.black54,
        transitionType: TransitionType.slideUp,
        duration: 500,
        label: "Msg Type Popup" 
      )
    );
  }

  @override
  void onInit() { // called immediately after the widget is allocated memory
    // fetchApi();
    super.onInit();
    clientContact =  Get.arguments;
  }

  @override
  void onReady() { // called after the widget is rendered on screen
    // showIntroDialog();
    super.onReady();
  }

  @override
  void onClose() { // called just before the Controller is deleted from memory
    // closeStream();
    super.onClose();
  }
}