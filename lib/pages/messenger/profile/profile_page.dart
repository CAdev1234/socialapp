import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/pages/messenger/profile/controller/profile_page_controller.dart';
import 'package:socialapp/pages/messenger/profile/profile_edit_page.dart';
import 'package:socialapp/pages/messenger/profile/profile_img_page.dart';
import 'package:socialapp/pages/messenger/security/security_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  ProfilePageController profilePageController = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor1,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: cPrimaryColor1
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Profile",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Positioned(
                          right: cDefaultPadding + 5,
                          child: Container(
                            alignment: Alignment.center,
                            width: 18,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.pop(context)
                              },
                              child: const Icon(
                                Icons.close, 
                                color: cPrimaryColor1, 
                                size: 15
                              ),
                            )
                          ) 
                        )
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 17, right: 27),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                  ),
                                  child: const CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/user5.jpg"),
                                    radius: 38,
                                  ),
                                ),
                                Positioned(
                                  top: 0, right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => ProfileImagePage()
                                        )
                                      ).then((value) => {
                                        
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 23, height: 23,
                                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                      child: const Icon(Icons.add_a_photo, color: cPrimaryColor1, size: 14,),
                                    ),
                                  ) 
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                alignment: Alignment.center,
                                height: 27,
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: const BorderRadius.all(Radius.circular(12))),
                                child: const Text(
                                  "Public Profile",
                                  style: TextStyle(fontSize: cFontSize12, color: Colors.white, decoration: TextDecoration.none),
                                ),
                              ),
                            ),
                            
                          ],
                        ),

                        const SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "John Smith",
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18,),
                                      ),
                                      const Text(
                                        "@johnsmith",
                                        style:TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10)),
                                      const SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center, width: 12, height: 12, margin: const EdgeInsets.only(right: 9),
                                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                            child: Container(
                                              width: 10, height: 10,
                                              decoration: const BoxDecoration(color: cActiveColor, shape: BoxShape.circle),
                                            ),
                                          ),
                                          const Text(
                                            "Available",
                                            style: TextStyle(color: Colors.white, fontSize: cFontSize10, fontWeight: FontWeight.w500,)),
                                          const SizedBox(width: 6),
                                          const Icon(Icons.arrow_drop_down, color: Colors.white, size: 23)
                                        ],
                                      )
                                    ],
                                  ),
                                  const Icon(Icons.qr_code_2, color: Colors.white, size: 35,),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: const [
                                      Text(
                                        "99,999",
                                        style: TextStyle(color: Colors.white, fontSize: cFontSize12, fontWeight: FontWeight.w500, decoration: TextDecoration.none),),
                                      Text(
                                        "Followers",
                                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500, decoration: TextDecoration.none),)
                                    ]
                                  ),

                                  Column(
                                    children: const [
                                      Text(
                                        "99,999",
                                        style: TextStyle(color: Colors.white, fontSize: cFontSize12, fontWeight: FontWeight.w500, decoration: TextDecoration.none),),
                                      Text(
                                        "Following",
                                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500, decoration: TextDecoration.none),)
                                    ]
                                  ),

                                  Column(
                                    children: const [
                                      Text(
                                        "58%",
                                        style: TextStyle(color: Colors.white, fontSize: cFontSize12, fontWeight: FontWeight.w500, decoration: TextDecoration.none),),
                                      Text(
                                        "Activity",
                                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500, decoration: TextDecoration.none),
                                      )
                                    ]
                                  )
                                ]
                              ),
                            ],
                          )
                        ),
                        
                      ],
                    ),
                  ),

                  const SizedBox(height: cDefaultPadding * 1.9),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: cDefaultPadding, horizontal: cDefaultPadding),
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed('/messenger/profile/profile_edit_page');
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(Icons.person, color: Colors.black, size: 20,),
                                      SizedBox(width: cDefaultPadding * 0.65),
                                      Text(
                                        "Personal Profile",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                                      )
                                    ],
                                  ) 
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Icon(Icons.chat, color: Colors.black, size: 20,),
                                      SizedBox(width: cDefaultPadding * 0.65),
                                      Text(
                                        "Chats",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                                      )
                                    ],
                                  ) 
                                ),
                                TextButton(
                                  onPressed: () {}, 
                                  child: Row(
                                    children: const [
                                      Icon(Icons.notifications, color: Colors.black, size: 20,),
                                      SizedBox(width: cDefaultPadding * 0.65),
                                      Text(
                                        "Notification",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                                    ],
                                  ) 
                                ),
                                TextButton(
                                  onPressed: () {}, 
                                  child: Row(
                                    children: const [
                                      Icon(Icons.image, color: Colors.black, size: 20,),
                                      SizedBox(width: cDefaultPadding * 0.65),
                                      Text(
                                        "Media",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                                    ],
                                  ) 
                                ),
                                TextButton(
                                  onPressed: () {}, 
                                  child: Row(
                                    children: const [
                                      Icon(Icons.text_snippet_sharp, color: Colors.black, size: 20,),
                                      SizedBox(width: cDefaultPadding * 0.65),
                                      Text(
                                        "Document",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                                    ],
                                  ) 
                                ),
                                TextButton(
                                  onPressed: () {}, 
                                  child: Row(
                                    children: const [
                                      Icon(Icons.settings, color: Colors.black, size: 20,),
                                      SizedBox(width: cDefaultPadding * 0.65),
                                      Text(
                                        "Settings",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                                    ],
                                  ) 
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed('/messenger/security/security_page');
                                  }, 
                                  child: Row(
                                    children: const [
                                      Icon(Icons.privacy_tip, color: Colors.black, size: 20,),
                                      SizedBox(width: cDefaultPadding * 0.65),
                                      Text(
                                        "Privacy & Security",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                                    ],
                                  ) 
                                ),
                                TextButton(
                                  onPressed: () {}, 
                                  child: Row(
                                    children: const [
                                      Icon(Icons.storage, color: Colors.black, size: 20,),
                                      SizedBox(width: cDefaultPadding * 0.65),
                                      Text(
                                        "Storage & Data",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                                    ],
                                  ) 
                                ),
                                TextButton(
                                  onPressed: () {}, 
                                  child: Row(
                                    children: const [
                                      Icon(Icons.help_center, color: Colors.black, size: 20,),
                                      SizedBox(width: cDefaultPadding * 0.65),
                                      Text(
                                        "Help Center",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                                    ],
                                  ) 
                                ),
                                TextButton(
                                  onPressed: () {}, 
                                  child: Row(
                                    children: const [
                                      Icon(Icons.support, color: Colors.black, size: 20,),
                                      SizedBox(width: cDefaultPadding * 0.65),
                                      Text(
                                        "Support",
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                                    ],
                                  ) 
                                ),
                              ],
                            ),  
                          ),

                          const SizedBox(height: 10,),

                          Row(
                            children: [
                              const SizedBox(width: 10),
                              const Text(
                                "LIGHT",
                                style: TextStyle(color: Colors.black, fontWeight:FontWeight.w600, fontSize: cFontSize12, decoration: TextDecoration.none)),
                              const SizedBox(width: 9,),
                              const SizedBox(width: 9,),
                              const Text(
                                "DARK",
                                style: TextStyle(color: Colors.black, fontWeight:FontWeight.w600, fontSize: cFontSize12, decoration: TextDecoration.none)),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: const [
                                    Icon(Icons.email, size: 20, color: Colors.black,),
                                    SizedBox(width: 8,),
                                    Text(
                                      "FEEDBACK",
                                      style: TextStyle( color: Colors.black, fontSize: cFontSize12, fontWeight: FontWeight.w600,))
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      )  
                    ),
                  )
                ],
              ),
            )
          ],
        ) 
      ),
    );
  }
}

