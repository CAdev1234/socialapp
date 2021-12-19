import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:socialapp/models/chat_group.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:socialapp/components/animation/custom_popup_route.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/models/chat_message.dart';
import 'package:socialapp/models/transition_type.dart';
import 'package:socialapp/pages/messenger/chat_room_page/components/msg_type_popup.dart';

class ChatRoomPageController extends GetxController {
  
  late BuildContext pageContext;
  List categoryList = ["All", "Saved", "Media"];
  RxInt categoryIdx = 0.obs;
  RxBool enableChatInputFocus = false.obs;
  RxBool enableRecord = false.obs;
  RxBool enableMsgCardOptions = false.obs;
  late List keyList;

  // RxString 

  initializeController(BuildContext context) {
    pageContext = context;
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
    SnackBar copySnackBar = const SnackBar(
      content: Text(cCopySuccessStr),
      backgroundColor: cPrimaryColor1,
    );
    closeMsgCardOptionsHandler();
    await Clipboard.setData(ClipboardData(text: demoChatMessage[idx].text));
    ScaffoldMessenger.of(pageContext).showSnackBar(copySnackBar);
  }

  msgMarkHandler(int idx) {
    closeMsgCardOptionsHandler();
    demoChatMessage[idx].messageActionStatus = MessageActionStatus.marked;
  }

  msgReplyHanlder(int idx) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    closeMsgCardOptionsHandler();
    ChatMessage repliedMsg = ChatMessage(
      userId: const Uuid().v1(), 
      text: "text", 
      messageType: ChatMessageType.text, 
      messageStatus: MessageStatus.notSent, 
      messageActionStatus: MessageActionStatus.replied, 
      isMine: true, 
      createdAt: formatter.format(now)
    );
    demoChatMessage.add(repliedMsg);
    keyList.add(GlobalKey());
  }

  msgForwardHandler(int idx) {
    closeMsgCardOptionsHandler();
    demoChatMessage[idx].messageActionStatus = MessageActionStatus.forwarded;
  }

  msgDeleteHandler(int idx) {
    closeMsgCardOptionsHandler();
    demoChatMessage[idx].messageActionStatus = MessageActionStatus.deleted;
  }
 
  @override
  void onInit() { // called immediately after the widget is allocated memory
    // fetchApi();
    super.onInit();
    List listData = [];
    for (var i = 0; i < demoGroups.length; i++) {
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