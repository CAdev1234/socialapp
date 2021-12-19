import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/components/search_input.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/pages/messenger/main_page/controller/main_page_controller.dart';
import 'package:socialapp/models/contact.dart';

class ContactsBody extends StatelessWidget {

  ContactsBody({Key? key}) : super(key: key);

  MainPageController mainPageController = MainPageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: cDefaultPadding * 0.8),
      padding: const EdgeInsets.only(top: cDefaultPadding * 0.8),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: mainPageController.chatTypeList.asMap().map((idx, item) => MapEntry(idx, 
              GestureDetector(
                onTap: () => mainPageController.updateChatTypeHanlder(idx),
                child: Obx(() => Container(
                  height: 24,
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: mainPageController.enableChatType.value == idx ? cPrimaryColor1 : Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12))
                  ),
                  child: Text(
                    item, 
                    style: TextStyle(color: mainPageController.enableChatType.value == idx ? Colors.white : Colors.black, fontSize: cFontSize12, fontWeight: FontWeight.bold)
                  ),
                ))
              ),
            )).values.toList(),
          ),
          const SizedBox(height: cDefaultPadding),
          Text(
            '${demoContacts.length.toString()} UNREAD MESSAGES',
            style: const TextStyle(color: cPrimaryColor1, fontSize: 10, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: cDefaultPadding * 0.4,
              left: cDefaultPadding,
              right: cDefaultPadding,
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: cDefaultPadding * 0.75),
                    child: SearchInput(),
                  )
                ),
                GestureDetector(
                  onTap: () => mainPageController.openMorePopupHandler(context),
                  child: const Icon(Icons.tune),
                )
              ],
            ),
          ),
          const SizedBox(height: 14,),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: demoContacts.length,
              itemBuilder: (context,  idx) => GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: cBoxShadow
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(demoContacts[idx].image),
                        radius: 25,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${demoContacts[idx].firstname} ${demoContacts[idx].lastname}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: cFontSize12,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              demoContacts[idx].isVerified ? Container(
                                margin: const EdgeInsets.only(left: 4),
                                alignment: Alignment.center,
                                width: 14,
                                height: 14,
                                decoration: const BoxDecoration(
                                  color: cPrimaryColor1,
                                  shape: BoxShape.circle
                                ),
                                child: const Icon(Icons.check, color: Colors.white, size: 10,),
                              ) : const SizedBox(width: 0,)
                            ],
                          ),
                          const Text(
                            "Hi, How are you doing",
                            style: TextStyle(
                              fontSize: cFontSize12,
                              color: Colors.black
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "3:36 PM",
                              style: TextStyle(
                                color: cPrimaryColor1 ,
                                fontSize: 10,
                                fontWeight: FontWeight.w500
                              ),
                            ),

                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 8),
                              width: 22,
                              height: 22,
                              decoration: const BoxDecoration(
                                color: cWarnColor,
                                shape: BoxShape.circle
                              ),
                              child: const Text(
                                "99+",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9
                                ),
                              ),
                            )
                          ],
                        ) 
                      )
                    ],
                  ),
                ),
              )
            )
          )
        ],
      ),
    );
  }
}