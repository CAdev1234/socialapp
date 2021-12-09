import 'package:flutter/material.dart';
import 'package:socialapp/components/custom_tab_bar.dart';
import 'package:socialapp/constants.dart';

class ChatRoomPage extends StatefulWidget {
  
  const ChatRoomPage({Key? key}) : super(key: key);
  final String pageTitle = "Jillian MacNab";

  @override
  State<ChatRoomPage> createState() => _ChatRoomState();
  
}


class _ChatRoomState extends State<ChatRoomPage> {
  final List categoryList = ["All", "Saved", "Media"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      appBar: AppBar(
        backgroundColor: cPrimaryColor,
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
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user.jpg"),
                    radius: 16,
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Jillian MacNab",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 14,
                          height: 14,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(7))
                          ),
                          child: const Icon(
                            Icons.check,
                            color: cPrimaryColor,
                            size: 10,
                          ),
                        )
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
        child: Column(
          children: [
            const SizedBox(height: 22),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                ),
                child: Column(
                  children: [
                    CustomTabBar(activeBg: cPrimaryColor, inactiveBg: Colors.white, activeColor: Colors.white, inactiveColor: Colors.black, tabList: categoryList),
                    const SizedBox(height: cDefaultPadding),

                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }
}