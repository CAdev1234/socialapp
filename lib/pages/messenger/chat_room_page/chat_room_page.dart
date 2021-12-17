import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:socialapp/components/messenger/chat_input.dart';
// import 'package:socialapp/components/messenger/msg_card.dart';
import 'package:socialapp/components/messenger/msg_card/msg_card.dart';
import 'package:socialapp/constants.dart';

import 'package:socialapp/models/chat_message.dart';
import 'package:socialapp/models/contact.dart';
import 'package:socialapp/pages/messenger/chat_room_page/controller/chat_room_page_controller.dart';

class ChatRoomPage extends StatelessWidget {
  
  ChatRoomPage({
    Key? key,
    required this.clientContact,
  }) : super(key: key);

  Contact clientContact;
  
  


  Widget emptyBody() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: const [
        Text(
              "Lorem ipsum dolor sit amet, consect\n adipiscing elit, sed do eiusmod tempor. sit\n amet, consectetur adipiscing elit",
              style: TextStyle(fontSize: cFontSize10, color: cContentColorLightTheme, fontWeight: FontWeight.w500,),
              textAlign: TextAlign.center,
            ),
        SizedBox(height: 150),
        Text(
          "Send your first message",
          style: TextStyle(color: cContentDisableColor, fontSize: cFontSize14),
        ),
      ],
    );
  }

  Widget chatBody(ChatRoomPageController pageController) {
    return Expanded(
      child: ListView.builder(
        itemCount: demoChatMessage.length,
        itemBuilder: (context, index) => GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Obx(() => Row(
              mainAxisAlignment: demoChatMessage[index].isMine ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                pageController.enableMsgCardOptions.value ? Showcase.withWidget(
                  // key: pageController.keyList[index],
                  key: pageController.keyList[index],
                  width: 230,
                  overlayPadding: const EdgeInsets.all(0),
                  radius: const BorderRadius.all(Radius.circular(10)),
                  disableAnimation: false,
                  height: 34,
                  child: GestureDetector(
                    child: MsgCard(
                      userContact: clientContact,
                      isMine: demoChatMessage[index].isMine, 
                      text: demoChatMessage[index].text, 
                      createdAt: demoChatMessage[index].createdAt,
                      messageActionStatus: demoChatMessage[index].messageActionStatus,
                    )
                  ),
                  onTargetClick: () => {debugPrint("onTargetClick event")},
                  container: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 230,
                    height: 34,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => pageController.msgCopyHandler(index),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 17,
                            child: Icon(Icons.copy_rounded, color: cContentDisableColor,),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => pageController.msgMarkHandler(index),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 17,
                            child: Icon(Icons.bookmark, color: cContentDisableColor,),
                          )
                        ),
                        GestureDetector(
                          onTap: () => pageController.msgReplyHanlder(index),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 17,
                            child: Icon(Icons.undo, color: cContentDisableColor,),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => pageController.msgForwardHandler(index),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 17,
                            child: Icon(Icons.redo, color: cContentDisableColor,),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => pageController.msgDeleteHandler(index),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 17,
                            child: Icon(Icons.delete, color: cWarnColor,),
                          ),
                        )
                      ],
                    ),
                  )

                ) 
                : 
                GestureDetector(
                  onLongPress: () => pageController.showMsgCardOptionsHandler(context, index),
                  child: MsgCard(
                    userContact: clientContact,
                    isMine: demoChatMessage[index].isMine, 
                    text: demoChatMessage[index].text, 
                    createdAt: demoChatMessage[index].createdAt,
                    messageActionStatus: demoChatMessage[index].messageActionStatus
                  )
                )
              ],
            ),)
          ),
        ) 
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    // ChatRoomPageController pageController = Get.put(ChatRoomPageController())..showMsgCardOptionsHandler(context);
    ChatRoomPageController pageController = Get.put(ChatRoomPageController())..initializeController(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cPrimaryColor1,
      appBar: AppBar(
        backgroundColor: cPrimaryColor1,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, size: cFontSize16),
              alignment: const Alignment(0, 0.0), // move icon a bit to the left
            );
          },
        ),
        title: SizedBox(
          width: double.infinity,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(17))),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(clientContact.image),
                    radius: 16,
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${clientContact.firstname} ${clientContact.lastname}',
                          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 6),
                        clientContact.isVerified ? Container(
                          width: 14,
                          height: 14,
                          decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle
                          ),
                          child: const Icon(
                            Icons.check,
                            color: cPrimaryColor1,
                            size: 10,
                          ),
                        ) : const SizedBox(width: 0,)
                      ]
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Last Active: 2min ago",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )
                  ]
                )
              ],
            ), 
          )
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            iconSize: 24,
            onPressed: () {},  
          ),
        ],
      ),

      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding, vertical: 0),
                    decoration: const BoxDecoration(
                      color: cChatRoomBgLightTheme,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: cDefaultPadding),

                        // tabbar
                        Container(
                          width: size.width,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: pageController.categoryList.asMap().map((idx, item) => MapEntry(idx, 
                              GestureDetector(
                                onTap: () => pageController.selectCategoryHandler(idx),
                                child: Obx(() => Container(
                                  height: 24, width: 52,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: pageController.categoryIdx.value == idx ? cPrimaryColor1 : Colors.transparent, borderRadius: const BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Text(
                                    item, 
                                    style: TextStyle(color: pageController.categoryIdx.value == idx ? Colors.white : Colors.black, fontSize: cFontSize12, fontWeight: FontWeight.bold)
                                  ),
                                ),)
                              ),
                            )).values.toList()
                          ),
                        ),
                        
                        const SizedBox(height: cDefaultPadding * 0.8),
                        Container(
                          alignment: Alignment.center,
                          width: size.width,
                          child: Container(
                            height: 20,
                            width: 72,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: cBoxShadow,
                            ),
                            child: const Text(
                              "Today", 
                              style: TextStyle(
                                color: cContentDisableColor, fontSize: 10
                              )
                            ),
                          ),
                        ),
                        const SizedBox(height: cDefaultPadding * 0.8),
                        
                        demoChatMessage.isEmpty ? emptyBody() : chatBody(pageController),
                      ],
                    ),
                  ) 
                ),

                Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding * 0.8, vertical: 5),
                  decoration: const BoxDecoration(color: cChatRoomBgLightTheme),
                  child: Obx(() => Row(
                    children: [
                      !pageController.enableRecord.value ? Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => pageController.openMsgTypePopupHandler(context),
                              child: const Icon(Icons.add, size: 25, color: Colors.black),
                            ),
                            const SizedBox(width: cDefaultPadding * 0.8),
                            Expanded(
                              child: ChatInput(returnFocusState: (bool val) => pageController.focusChatInputHandler(val))
                            ),
                            const SizedBox(width: cDefaultPadding * 0.7),
                          ]
                        ),
                      )
                      :
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Icons.mic, color: cWarnColor, size: 20,),
                            const SizedBox(width: 5,),
                            const Text(
                              "00:10",
                              style: TextStyle(color: Colors.black, fontSize: cFontSize14, fontWeight: FontWeight.w600),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  "Slide to cancel",
                                  style: TextStyle(color: cContentDisableColor, fontSize: cFontSize14)
                                ) 
                              ),
                            )
                          ],
                        ),
                      ),
                      
                      !pageController.enableChatInputFocus.value && !pageController.enableRecord.value ? Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.camera_alt_rounded, color: Colors.black, size: 20),
                          ),
                          const SizedBox(width: cDefaultPadding),
                          GestureDetector(
                            onTap: () => pageController.createRecordHandler(true),
                            child: const Icon(Icons.mic, color: Colors.black, size: 25),
                          )
                        ],
                      ) : const Icon(Icons.send, color: cPrimaryColor1, size: 25,),
                      
                    ],
                  ),)
                )
              ]
            ),
          ]
        )
      )
    );
  }


}