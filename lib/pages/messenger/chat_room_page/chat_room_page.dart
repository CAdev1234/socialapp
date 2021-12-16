import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:socialapp/components/messenger/chat_input.dart';
import 'package:socialapp/components/animation/custom_popup_route.dart';
import 'package:socialapp/components/messenger/msg_card/msg_card.dart';
import 'package:socialapp/constants.dart';

import 'package:socialapp/models/chat_message.dart';
import 'package:socialapp/models/contact.dart';
import 'package:socialapp/models/transition_type.dart';
import 'package:socialapp/pages/messenger/chat_room_page/components/msg_type_popup.dart';

class ChatRoomPage extends StatefulWidget {
  
  const ChatRoomPage({Key? key, required this.userContact}) : super(key: key);
  final Contact userContact;
  

  @override
  State<ChatRoomPage> createState() => _ChatRoomState();
  
}


class _ChatRoomState extends State<ChatRoomPage> {

  final List categoryList = ["All", "Saved", "Media"];
  int categoryIdx = 0;

  bool enableChatInputFocus = false;
  bool enableRecord = false;

  final keyOne = GlobalKey();
  // Future httpGet(String url) {
  //   return Future.delayed(const Duration(seconds: 3), () {
  //     debugPrint("OKKKKKKKK");
  //   });
  // }

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)!.startShowCase(
        [keyOne]
      )
    );
  }

  void selectCategoryHandler(int idx) {
    setState(() {
      categoryIdx = idx;
    });
  }

  focusChatInputHandler(bool value) {
    setState(() {
      enableChatInputFocus = value;
    });
  }

  createRecordHandler(bool value) {
    setState(() {
      enableRecord = value;
    });
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

  Widget chatBody() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: demoChatMessage.length,
        itemBuilder: (context, index) => GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: demoChatMessage[index].isMine ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                MsgCard(isMine: demoChatMessage[index].isMine, text: demoChatMessage[index].text, createdAt: demoChatMessage[index].createdAt,)
              ],
            ),
          ),
        ) 
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
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
              icon: Showcase(
                key: keyOne, 
                child: Icon(Icons.arrow_back_ios, size: cFontSize16), 
                description: "description"
              ),
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
                    backgroundImage: AssetImage(widget.userContact.image),
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
                          '${widget.userContact.firstname} ${widget.userContact.lastname}',
                          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 6),
                        widget.userContact.isVerified ? Container(
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
                            children: categoryList.asMap().map((idx, item) => MapEntry(idx, 
                              GestureDetector(
                                onTap: () => selectCategoryHandler(idx),
                                child: Container(
                                  height: 24, width: 52,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: categoryIdx == idx ? cPrimaryColor1 : Colors.transparent, borderRadius: const BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Text(
                                    item, 
                                    style: TextStyle(color: categoryIdx == idx ? Colors.white : Colors.black, fontSize: cFontSize12, fontWeight: FontWeight.bold)
                                  ),
                                ),
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
                        
                        demoChatMessage.isEmpty ? emptyBody() : chatBody(),
                      ],
                    ),
                  ) 
                ),

                Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding * 0.8, vertical: 5),
                  decoration: const BoxDecoration(color: cChatRoomBgLightTheme),
                  child: Row(
                    children: [
                      !enableRecord ? Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => openMsgTypePopupHandler(context),
                              child: const Icon(Icons.add, size: 25, color: Colors.black),
                            ),
                            const SizedBox(width: cDefaultPadding * 0.8),
                            Expanded(
                              child: ChatInput(returnFocusState: (bool val) => focusChatInputHandler(val))
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
                      
                      !enableChatInputFocus && !enableRecord ? Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.camera_alt_rounded, color: Colors.black, size: 20),
                          ),
                          const SizedBox(width: cDefaultPadding),
                          GestureDetector(
                            onTap: () => createRecordHandler(true),
                            child: const Icon(Icons.mic, color: Colors.black, size: 25),
                          )
                        ],
                      ) : const Icon(Icons.send, color: cPrimaryColor1, size: 25,),
                      
                    ],
                  ),
                )

              ]
            ),
            
          ]
        )
      )
    );
  }


}