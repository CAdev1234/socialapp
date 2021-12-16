import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/pages/messenger/profile/controller/profile_complete_page_controller.dart';

class ProfileCompletePage extends StatelessWidget {
  ProfileCompletePage({Key? key}) : super(key: key);

  ProfileCompletePageController pageController = ProfileCompletePageController();

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
                                  "Save Picture",
                                  style: TextStyle(fontSize: cFontSize12, color: Colors.white),
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
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                      ),
                                      const Text(
                                        "@johnsmith",
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10),
                                      ),
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
                                            style: TextStyle(color: Colors.white, fontSize: cFontSize10, fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(width: 6),
                                          const Icon(Icons.arrow_drop_down, color: Colors.transparent, size: 23)
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
                                        style: TextStyle(color: Colors.white, fontSize: cFontSize12, fontWeight: FontWeight.w500),),
                                      Text(
                                        "Followers",
                                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),)
                                    ]
                                  ),

                                  Column(
                                    children: const [
                                      Text(
                                        "99,999",
                                        style: TextStyle(color: Colors.white, fontSize: cFontSize12, fontWeight: FontWeight.w500),),
                                      Text(
                                        "Following",
                                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),)
                                    ]
                                  ),

                                  Column(
                                    children: const [
                                      Text(
                                        "58%",
                                        style: TextStyle(color: Colors.white, fontSize: cFontSize12, fontWeight: FontWeight.w500, decoration: TextDecoration.none),),
                                      Text(
                                        "Activity",
                                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500, decoration: TextDecoration.none),)
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
                      child: ListView(
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Email ID",
                                style: TextStyle(fontSize: cFontSize12, color: Colors.black,  ),
                              ),
                              Spacer(),
                              Icon(Icons.copy, color: cContentDisableColor, size: 15  )
                            ],
                          ),
                          const SizedBox(height: 4,),
                          const Text(
                            "JillianMacNab@gmail.com",
                            style: TextStyle( fontSize: cFontSize14, color: Colors.black, fontWeight: FontWeight.w600 ),
                          ),

                          const SizedBox(height: 26),
                          Row(
                            children: const [
                              Text(
                                "Date of birth",
                                style: TextStyle(fontSize: cFontSize12, color: Colors.black,  ),
                              ),
                              Spacer(),
                            ],
                          ),
                          const SizedBox(height: 4,),
                          const Text(
                            "20/12/1990",
                            style: TextStyle( fontSize: cFontSize14, color: Colors.black, fontWeight: FontWeight.w600 ),
                          ),

                          const SizedBox(height: 26),
                          Row(
                            children: const [
                              Text(
                                "Mobile Number",
                                style: TextStyle(fontSize: cFontSize12, color: Colors.black,  ),
                              ),
                              Spacer(),
                              Icon(Icons.copy, color: cContentDisableColor, size: 15  )
                            ],
                          ),
                          const SizedBox(height: 4,),
                          const Text(
                            "+91 8888 888 888",
                            style: TextStyle( fontSize: cFontSize14, color: Colors.black, fontWeight: FontWeight.w600 ),
                          ),

                          const SizedBox(height: 26),
                          Row(
                            children: const [
                              Text(
                                "Country",
                                style: TextStyle(fontSize: cFontSize12, color: Colors.black,  ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4,),
                          const Text(
                            "USA",
                            style: TextStyle( fontSize: cFontSize14, color: Colors.black, fontWeight: FontWeight.w600 ),
                          ),

                          const SizedBox(height: 26),
                          Row(
                            children: const [
                              Text(
                                "Gender",
                                style: TextStyle(fontSize: cFontSize12, color: Colors.black,  ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4,),
                          const Text(
                            "Female",
                            style: TextStyle( fontSize: cFontSize14, color: Colors.black, fontWeight: FontWeight.w600 ),
                          ),


                          const SizedBox(height: 26),
                          Row(
                            children: const [
                              Text(
                                "Bio",
                                style: TextStyle(fontSize: cFontSize12, color: Colors.black,  ),
                              ),
                              Spacer(),
                              Icon(Icons.copy, color: cContentDisableColor, size: 15  )
                            ],
                          ),
                          const SizedBox(height: 4,),
                          const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation.",
                            style: TextStyle( fontSize: cFontSize14, color: Colors.black, fontWeight: FontWeight.w600 ),
                          ),

                        ],
                      ),
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
