import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/components/search_input.dart';
import 'package:messenger/models/contact.dart';
import 'package:messenger/pages/messenger/chat_room.dart';


class NewChatPage extends StatefulWidget {
  const NewChatPage({Key? key}) : super(key: key);
  final String pageTitle = "New Chat";
  @override
  State<NewChatPage> createState() => _NewChatPageState();
}


class _NewChatPageState extends State<NewChatPage> {
  void _moreActionHandler() {

  }
  void _navigateChatRoomPageHandler() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage()));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const ChatRoomPage()
      )
    ).then((value) => {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C_PrimaryColor,
      appBar: AppBar(
        backgroundColor: C_PrimaryColor,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
              alignment: const Alignment(0, 0.0), // move icon a bit to the left
            );
          },
        ),
        title: Text(widget.pageTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: _moreActionHandler,  
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: C_DefaultPadding * 2),
                padding: const EdgeInsets.only(top: C_DefaultPadding),
                decoration: const BoxDecoration( 
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: C_DefaultPadding, left: C_DefaultPadding),
                      child: SearchInput(),
                    ),
                    const SizedBox(height: C_DefaultPadding * 0.75),
                    const Text(
                      "Frequently Used Contacts",
                      style: TextStyle(color: C_PrimaryColor, fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: C_DefaultPadding * 0.6),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        itemCount: freContactData.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: _navigateChatRoomPageHandler,
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
                                    CircleAvatar(
                                      backgroundImage: AssetImage(freContactData[index].image),
                                      radius: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, right: 6),
                                      child: 
                                        Text(
                                          freContactData[index].name, 
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 12)
                                          ),
                                    ),
                                    Container(
                                      width: 14,
                                      height: 14,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: contactData[index].isVerified ? C_PrimaryColor : Colors.white, borderRadius: const BorderRadius.all(Radius.circular(7))
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
                    const SizedBox(height: 17),
                    const Text(
                      'All Contacts',
                      style: TextStyle(color: C_PrimaryColor, fontSize: 10, fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                          itemCount: contactData.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: _navigateChatRoomPageHandler,
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
                                      CircleAvatar(
                                        backgroundImage: AssetImage(contactData[index].image),
                                        radius: 16,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 6),
                                        child: 
                                          Text(
                                            contactData[index].name, 
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 12)
                                            ),
                                      ),
                                      Container(
                                        width: 14,
                                        height: 14,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: contactData[index].isVerified ? C_PrimaryColor : Colors.white, borderRadius: const BorderRadius.all(Radius.circular(7))
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
      ),
    );
  }
}