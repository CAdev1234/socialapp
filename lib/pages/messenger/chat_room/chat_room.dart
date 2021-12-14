import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:socialapp/components/messenger/chat_input.dart';
import 'package:socialapp/components/animation/custom_popup_route.dart';
import 'package:socialapp/components/messenger/msg_card.dart';
import 'package:socialapp/constants.dart';

import 'package:socialapp/models/chat_message.dart';
import 'package:socialapp/models/contact.dart';
import 'package:socialapp/models/transition_type.dart';
import 'package:socialapp/pages/messenger/chat_room/components/msg_type_popup.dart';

class ChatRoomPage extends StatefulWidget {
  
  const ChatRoomPage({Key? key, required this.userContact}) : super(key: key);
  final Contact userContact;
  

  @override
  State<ChatRoomPage> createState() => _ChatRoomState();
  
}


class _ChatRoomState extends State<ChatRoomPage> {
  final List categoryList = ["All", "Saved", "Media"];
  bool enableAllOption = true;
  bool enableSavedOption = false;
  bool enableMediaOption = false;
  bool enableChatInputFocus = false;

  Future httpGet(String url) {
    return Future.delayed(const Duration(seconds: 3), () {
      debugPrint("OKKKKKKKK");
    });
  }

  void getAllHandler() {
    setState(() {
      enableAllOption = true;
      enableSavedOption = false;
      enableMediaOption = false;
    });
    
  }

  void getSavedHandler() {
    setState(() {
      enableAllOption = false;
      enableSavedOption = true;
      enableMediaOption = false;
    });
  }

  void getMediaHandler() {
    setState(() {
      enableAllOption = false;
      enableSavedOption = false;
      enableMediaOption = true;
    });
  }

  void updateChatInputHanlder(bool value) {
    setState(() {
      enableChatInputFocus = value;
    });
  }

  void openMsgTypePopupHandler() {
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
                            children: [
                              GestureDetector(
                                onTap: getAllHandler,
                                child: Container(
                                  height: 24, width: 52,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: enableAllOption ? cPrimaryColor1 : Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Text(
                                    "All", 
                                    style: TextStyle(color: enableAllOption ? Colors.white : Colors.black, fontSize: cFontSize12, fontWeight: FontWeight.bold)
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: getSavedHandler,
                                child: Container(
                                  height: 24, width: 52,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: enableSavedOption ? cPrimaryColor1 : Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Text(
                                    "Saved", 
                                    style: TextStyle(color: enableSavedOption ? Colors.white : Colors.black, fontSize: cFontSize12, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              GestureDetector(
                                onTap: getMediaHandler,
                                child: Container(
                                  height: 24, width: 52,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: enableMediaOption ? cPrimaryColor1 : Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Text(
                                    "Media", 
                                    style: TextStyle(color: enableMediaOption ? Colors.white : Colors.black, fontSize: cFontSize12, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              
                            ],
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
                        
                        demoChatMessage.isEmpty ? emptyBody() : chatBody()

                        
                      ],
                    ),
                  ) 
                ),
              ]
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding * 0.8, vertical: 5),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: openMsgTypePopupHandler,
                      child: const Icon(Icons.add, size: 25, color: Colors.black),
                    ),
                    const SizedBox(width: cDefaultPadding * 0.8),
                    Expanded(
                      child: ChatInput(returnFocusState: (bool val) => updateChatInputHanlder(val))
                    ),
                    const SizedBox(width: cDefaultPadding * 0.7),
                    !enableChatInputFocus ? Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.camera_alt_rounded, color: Colors.black, size: 20),
                        ),
                        const SizedBox(width: cDefaultPadding),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.mic, color: Colors.black, size: 25),
                        )
                      ],
                    ) : const Icon(Icons.send, color: cPrimaryColor1, size: 25,),
                    
                  ],
                ),
              )
              
            ),
            
          ]
        )
      )
    );
  }
}