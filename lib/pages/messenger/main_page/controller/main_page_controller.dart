import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:socialapp/components/animation/custom_popup_route.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/models/chat_group.dart';
import 'package:socialapp/models/transition_type.dart';
import 'package:socialapp/pages/messenger/main_page/components/more_popup_body.dart';
import 'package:socialapp/services/firebase_service.dart';

class MainPageController extends GetxController with StateMixin<List> {

  late BuildContext pageContext;
  List allContacts = [].obs;
  String pageTitle = "Messenger";
  List chatCategory = ['Contacts', 'Groups', 'Communities', 'Others'];
  RxInt enableCategory = 0.obs;
  List chatTypeList = ['Primary', 'General', 'Requests'];
  RxInt enableChatType = 0.obs;
  RxBool isLoading = true.obs;

  List groupKeyList = List.generate(demoGroups.length, (index) => GlobalKey());

  final enableGroupMsgCardOptions = RxBool(false);


  initializeController(BuildContext context) async {
    pageContext = context;
  }


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

  showGroupCardOptionsHandler(BuildContext context, int idx) {
    enableGroupMsgCardOptions.value = true;
    ShowCaseWidget.of(context)!.startShowCase(
      [groupKeyList[idx]]
    );
  }

  closeMsgCardOptionsHandler() {
    enableGroupMsgCardOptions.value = false;
  }
  
  addMemberToGroupHandler() {
    closeMsgCardOptionsHandler();
  }

  pinGroupHandler() {
    closeMsgCardOptionsHandler();
  }

  muteGroupHandler() {
    closeMsgCardOptionsHandler();
  }

  bagGroupHandler() {
    closeMsgCardOptionsHandler();
  }

  leaveGroupHandler() {
    closeMsgCardOptionsHandler();
  }
  

  @override
  void onInit() async { // called immediately after the widget is allocated memory
    // fetchApi();
    debugPrint("oninit called");
    FirebaseService fbService = FirebaseService();
    try {
      await fbService.getFBContacts().then((data) => {
        allContacts = data,
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

  // @override
  // void onReady() { // called after the widget is rendered on screen
  //   // showIntroDialog();
  //   super.onReady();
  // }

  // @override
  // void onClose() { // called just before the Controller is deleted from memory
  //   // closeStream();
  //   super.onClose();
  // }
    
}