import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/components/messenger/radio_group.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/models/security.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {

  int? _phoneRadioValue = 0;

  @override
  void initState() {
    
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
              icon: const Icon(Icons.arrow_back_ios,size: cFontSize16),
              alignment: const Alignment(0, 0.0), // move icon a bit to the left
            );
          },
        ),
        title: const Text("Privarcy & Security", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            width: size.width,
            padding: const EdgeInsets.only(top: cDefaultPadding * 0.8, bottom: cDefaultPadding * 1.5 ),
            decoration: const BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            child: Column(
              children: [
                const SizedBox(
                  width: 224,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor. sit amet, consectetur adipiscing elit",
                    style: TextStyle(fontSize: cFontSize10, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(left: cDefaultPadding * 1.8),
                  height: 46, width: size.width, alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    color: cInputBorderColor
                  ),
                  child: const Text(
                    "Privacy",
                    style: TextStyle(color: Colors.black, fontSize: cFontSize18, fontWeight: FontWeight.w600 ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: cDefaultPadding * 0.6, right: cDefaultPadding * 0.6, top: 13),
                    child: ListView.builder(
                      itemCount: demoSecurity.length + 1,
                      itemBuilder: (context, idx) => idx != demoSecurity.length ? Container(
                        padding: const EdgeInsets.only(top: cDefaultPadding, bottom: cDefaultPadding, left: cDefaultPadding, right: cDefaultPadding),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: const BoxDecoration(
                          color: cChatRoomBgLightTheme,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: cBoxShadow
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                demoSecurity[idx].icon,
                                const SizedBox(width: 13,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      demoSecurity[idx].title,
                                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: cFontSize14,)
                                    ),
                                    demoSecurity[idx].value != '' ? Text(
                                      demoSecurity[idx].value,
                                      style: const TextStyle(color: cPrimaryColor2, fontWeight: FontWeight.w500, fontSize: cFontSize12,)
                                    ) : const SizedBox(),
                                    
                                  ],
                                ),
                                const Spacer(),
                                const Text(
                                  "Who can see",
                                  style: TextStyle(color: cContentDisableColor, fontWeight: FontWeight.bold, fontSize: cFontSize12, fontStyle: FontStyle.italic)
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            RadioGroup(
                              radioList: const ["Nobody", "My Contacts", "Everybody"],
                              radioSize: 16,
                              activeBorderColor: cPrimaryColor1,
                              inactiveBorderColor: cContentDisableColor,
                              activeColor: cPrimaryColor2,
                              inactiveColor: cInputBorderColor,
                              value: 0,
                              groupValue: 0,
                            )
                          ],
                        ),
                      ) 
                      : 
                      Container(
                        padding: const EdgeInsets.only(top: cDefaultPadding, bottom: cDefaultPadding, left: cDefaultPadding, right: cDefaultPadding),
                        decoration: const BoxDecoration(
                          color: cChatRoomBgLightTheme,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: cBoxShadow
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.block, size: 20,),
                                const SizedBox(width: 13,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Block Contacts",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: cFontSize14,)
                                    ),
                                    Text(
                                      "327 Contacts",
                                      style: TextStyle(color: cPrimaryColor2, fontWeight: FontWeight.w500, fontSize: cFontSize12,)
                                    ),
                                    
                                  ],
                                ),
                                const Spacer(),
                                const Text(
                                  "View All",
                                  style: TextStyle(color: cPrimaryColor1, fontWeight: FontWeight.bold, fontSize: cFontSize14)
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                )
                
              ],
            ),
          ),
        )
      ),
    );
  }
}