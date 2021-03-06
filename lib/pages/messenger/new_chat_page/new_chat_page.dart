import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:socialapp/components/messenger/empty_avatar.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/components/search_input.dart';
import 'package:socialapp/pages/messenger/chat_room_page/chat_room_page.dart';
import 'package:socialapp/pages/messenger/chat_room_page/controller/chat_room_page_controller.dart';
import 'package:socialapp/pages/messenger/new_chat_page/controller/new_chat_page_controller.dart';
// import 'package:socialapp/pages/messenger/chat_room_page/chat_room_page.dart';


class NewChatPage extends StatelessWidget {
  
  NewChatPage({Key? key}) : super(key: key);
  
  NewChatPageController newChatPageController = Get.put(NewChatPageController());
  ChatRoomPageController chatRoomPageController = Get.put(ChatRoomPageController());

  void moreActionHandler() {

  }
  void navigateChatRoomPageHandler(int index, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => ShowCaseWidget(
          builder: Builder(
            builder: (_) => ChatRoomPage(clientContact: newChatPageController.allContacts[index],),
          ),
          onFinish: () => chatRoomPageController.closeMsgCardOptionsHandler(),
        )
      )
    ).then((value) => {
      
    });
  }


  
  @override
  Widget build(BuildContext context) {
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
        title: Text(newChatPageController.pageTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: moreActionHandler,  
          ),
        ],
      ),

      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: cDefaultPadding),
                    decoration: const BoxDecoration( 
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: cDefaultPadding, left: cDefaultPadding),
                          child: SearchInput(),
                        ),
                        const SizedBox(height: cDefaultPadding * 0.75),
                        const Text(
                          "Frequently Used Contacts",
                          style: TextStyle(color: cPrimaryColor1, fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: cDefaultPadding * 0.6),
                        SizedBox(
                          height: 120,
                          child: Obx(() => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: newChatPageController.allContacts.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () => navigateChatRoomPageHandler(index, context),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.14),
                                        offset: Offset(
                                          0.0,
                                          1.0,
                                        ),
                                        blurRadius: 3.0,
                                        spreadRadius: -1.0,
                                      ), //BoxShadowBoxShadow
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: Row(
                                      children: [
                                        newChatPageController.allContacts[index]['image'] == '' ? EmptyAvatar(avatarType: 'person', radius: 16,) :CircleAvatar(
                                          backgroundImage: AssetImage(newChatPageController.allContacts[index]['image']),
                                          radius: 16,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, right: 6),
                                          child: 
                                            Text(
                                              '${newChatPageController.allContacts[index]['firstname']} ${newChatPageController.allContacts[index]['lastname']}', 
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: cFontSize12)
                                              ),
                                        ),
                                        Container(
                                          width: 14,
                                          height: 14,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: newChatPageController.allContacts[index]['isVerified'] ? cPrimaryColor1 : Colors.white, borderRadius: const BorderRadius.all(Radius.circular(7))
                                          ),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 10,
                                          ),
                                        )
                                      ]
                                    ),
                                  )
                                ), 
                              )
                            ) 
                          ))
                        ),
                        const SizedBox(height: 17),
                        const Text(
                          'All Contacts',
                          style: TextStyle(color: cPrimaryColor1, fontSize: 10, fontWeight: FontWeight.bold)
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: newChatPageController.allContacts.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () => navigateChatRoomPageHandler(index, context),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.14),
                                        offset: Offset(
                                          0.0,
                                          1.0,
                                        ),
                                        blurRadius: 3.0,
                                        spreadRadius: -1.0,
                                      ), //BoxShadowBoxShadow
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: Row(
                                      children: [
                                        newChatPageController.allContacts[index]['image'] == '' ? EmptyAvatar(avatarType: 'person', radius: 16,) :CircleAvatar(
                                          backgroundImage: AssetImage(newChatPageController.allContacts[index]['image']),
                                          radius: 16,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, right: 6),
                                          child: 
                                            Text(
                                              '${newChatPageController.allContacts[index]['firstname']} ${newChatPageController.allContacts[index]['lastname']}', 
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: cFontSize12)
                                              ),
                                        ),
                                        Container(
                                          width: 14,
                                          height: 14,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: newChatPageController.allContacts[index]['isVerified'] ? cPrimaryColor1 : Colors.white, borderRadius: const BorderRadius.all(Radius.circular(7))
                                          ),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 10,
                                          ),
                                        )
                                      ]
                                    ),
                                  )
                                ), 
                              )
                            ) 
                          ),
                        ),

                      ]
                    ),
                  )
                ),
              ]
            ),
          ]
        )
      ),
    );
  }
}

