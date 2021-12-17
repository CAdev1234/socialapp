import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:socialapp/components/animation/custom_popup_route.dart';
import 'package:socialapp/models/chat_message.dart';
import 'package:socialapp/models/transition_type.dart';
import 'package:socialapp/pages/messenger/chat_room_page/components/msg_type_popup.dart';

class ChatRoomPageController extends GetxController {
  
  late BuildContext showcaseContext;
  List categoryList = ["All", "Saved", "Media"];
  RxInt categoryIdx = 0.obs;

  RxBool enableChatInputFocus = false.obs;
  RxBool enableRecord = false.obs;

  final chatKeyForOverlay = GlobalKey();
  RxBool enableMsgCardOptions = false.obs;

  late List keyList;

  initializeController(BuildContext context) {
    showcaseContext = context;
  }
  
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

  showMsgCardOptionsHandler(BuildContext context, int idx) {
    enableMsgCardOptions.value = true;
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)!.startShowCase(
        [keyList[idx]]
      )
    );
  }

  closeMsgCardOptionsHandler() {
    enableMsgCardOptions.value = false;
  }

  Future<void> msgCopyHandler(int idx) async {
    closeMsgCardOptionsHandler();
    await Clipboard.setData(ClipboardData(text: demoChatMessage[idx].text));
  }

  msgMarkHandler(int idx) {
    closeMsgCardOptionsHandler();
  }

  msgReplyHanlder(int idx) {
    closeMsgCardOptionsHandler();
  }

  msgForwardHandler(int idx) {
    closeMsgCardOptionsHandler();
  }

  msgDeleteHandler(int idx) {
    closeMsgCardOptionsHandler();
  }
 
  @override
  void onInit() { // called immediately after the widget is allocated memory
    // fetchApi();
    super.onInit();
    List listData = [];
    for (var i = 0; i < demoChatMessage.length; i++) {
      listData.add(GlobalKey());
    }
    keyList = listData;
    // clientContact =  Get.arguments;
    
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