import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:socialapp/components/animation/custom_popup_route.dart';
import 'package:socialapp/models/chat_group.dart';
import 'package:socialapp/models/transition_type.dart';
import 'package:socialapp/pages/messenger/main_page/components/more_popup_body.dart';

class MainPageController extends GetxController {

  String pageTitle = "Messenger";
  List chatCategory = ['Contacts', 'Groups', 'Communities', 'Others'];
  RxInt enableCategory = 0.obs;
  List chatTypeList = ['Primary', 'General', 'Requests'];
  RxInt enableChatType = 0.obs;

  List groupKeyList = [GlobalKey(), GlobalKey()];

  RxBool enableMsgCardOptions = false.obs;



  updateChatCategoryHandler(int idx) {
    enableCategory.value = idx;
  }

  updateChatTypeHanlder(int idx) {
    enableChatType.value = idx;
  }

  openMorePopupHandler(context) {
    Navigator.of(context).push(
      CustomPopupRoute(
        builder: (context) {
          return const MorePopupBody();
        }, 
        transitionType: TransitionType.scale,
        duration: 200,
        dismissible: false, 
        color: Colors.black54, 
        label: "More Popup"
      ));
  }

  showMsgCardOptionsHandler(BuildContext context, int idx) {
    enableMsgCardOptions.value = true;
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)!.startShowCase(
        [groupKeyList[idx]]
      )
    );
  }

  closeMsgCardOptionsHandler() {
    enableMsgCardOptions.value = false;
  }
  
  addMemberToGroupHandler() {

  }

  pinGroupHandler() {

  }

  muteGroupHandler() {

  }

  bagGroupHandler() {

  }

  leaveGroupHandler() {

  }
  

  @override
  void onInit() { // called immediately after the widget is allocated memory
    // fetchApi();
    super.onInit();
    List listData = [];
    for (var i = 0; i < demoGroups.length; i++) {
      listData.add(GlobalKey());
    }
    groupKeyList = listData;
    debugPrint(groupKeyList.toString());
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