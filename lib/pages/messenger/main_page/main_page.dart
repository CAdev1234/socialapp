import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:socialapp/components/messenger/empty_avatar.dart';
import 'package:socialapp/components/search_input.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/models/transition_type.dart';
import 'package:socialapp/pages/messenger/main_page/components/group_card.dart';
import 'package:socialapp/pages/messenger/main_page/controller/main_page_controller.dart';
import 'package:socialapp/models/chat_group.dart';


class RouteTransitionType {
  String title;
  TransitionType transitionType;

  RouteTransitionType({required this.title, required this.transitionType});
}


class MessengerMainPage extends StatelessWidget {
  MessengerMainPage({Key? key}) : super(key: key);

  
  final String transitionStr = "Default";
  // final MainPageController mainPageController = Get.put(MainPageController());

  

  void navigateNewChatPageHandler() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => const NewChatPage()));
    
    // MaterialPageRoute
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => const NewChatPage()
    //   )
    // ).then((value) => {
      
    // });

    // PageRouteBuilder
    // Navigator.of(context).push(
    //   PageRouteBuilder(
    //     pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    //       return const NewChatPage();
    //     },
    //     transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    //       return Align(
    //         child: SizeTransition(sizeFactor: animation, child: child),
    //       );
    //     },
    //     transitionDuration: const Duration(milliseconds: 500)
    //   )
    // ).then((value) => {
      
    // });

    
    // TransitionType transition
    if (transitionStr == 'Default') {
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (BuildContext context) => const NewChatPage()
      //   )
      // ).then((value) => {
        
      // });
      // Get.to(const NewChatPage());
      Get.toNamed("/messenger/new_chat_page");
    }else {
      // Navigator.of(context).push(
      //   Transitions(
      //       // transitionType: _routeTransitionTypeList[0].transitionType,
      //       transitionType: (_routeTransitionTypeList.where((item) => item.title == widget.transitionStr).toList())[0].transitionType,
      //       duration: const Duration(milliseconds: 500),
      //       curve: Curves.bounceInOut,
      //       reverseCurve: Curves.fastOutSlowIn,
      //       widget: const NewChatPage()
      //   ),
      // ).then((value) => {
      // });
    }
    
  }
  
  Widget contactBody(MainPageController mainPageController, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: cDefaultPadding * 0.8),
      padding: const EdgeInsets.only(top: cDefaultPadding * 0.8),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25))),
      child: mainPageController.allContacts.isEmpty ? contactEmpty()
        :
        Column(
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
              '${mainPageController.allContacts.length.toString()} UNREAD MESSAGES',
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
                itemCount: mainPageController.allContacts.length,
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
                        if (mainPageController.allContacts[idx]['image'] == '') EmptyAvatar(avatarType: 'person', radius: 25,),
                        if (mainPageController.allContacts[idx]['image'] != '') CircleAvatar(
                          backgroundImage: AssetImage(mainPageController.allContacts[idx]['image']),
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
                                  '${mainPageController.allContacts[idx]['firstname']} ${mainPageController.allContacts[idx]['lastname']}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: cFontSize12,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                mainPageController.allContacts[idx]['isVerified'] ? Container(
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

  Widget contactEmpty() {
    return Center(
      child: Column(
        children: [
          // SvgPicture.asset("assets/images/emptyContact.svg"),
          SizedBox(height: 40,),
          Text(
            "You have no messages to display",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: cFontSize14),
          )
        ],
      ),
    );
  }
  
  Widget groupBody(MainPageController mainPageController, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: cDefaultPadding * 0.8),
      padding: const EdgeInsets.only(top: cDefaultPadding * 0.8, left: 8, right: 8),
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
            '${demoGroups.length.toString()} UNREAD MESSAGES',
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
          const SizedBox(height: 14),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 50),
              physics: const BouncingScrollPhysics(),
              itemCount: demoGroups.length,
              itemBuilder: (context,  idx) => Column(
                  children: [
                    Obx(() => mainPageController.enableGroupMsgCardOptions.value ? 
                      GestureDetector(
                        child: Showcase.withWidget(
                          key: mainPageController.groupKeyList[idx],
                          width: 230,
                          overlayPadding: const EdgeInsets.all(0),
                          radius: const BorderRadius.all(Radius.circular(10)),
                          disableAnimation: false,
                          height: 34,
                          child: GroupCard(idx: idx,),
                          container: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 230,
                                height: 34,
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => mainPageController.addMemberToGroupHandler(),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 17,
                                        child: Icon(Icons.person_add, color: cContentDisableColor,),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => mainPageController.pinGroupHandler(),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 17,
                                        child: Icon(Icons.push_pin, color: cContentDisableColor,),
                                      )
                                    ),
                                    GestureDetector(
                                      onTap: () => mainPageController.muteGroupHandler(),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 17,
                                        child: Icon(Icons.volume_off, color: cContentDisableColor,),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => mainPageController.bagGroupHandler(),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 17,
                                        child: Icon(Icons.shopping_bag, color: cContentDisableColor,),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => mainPageController.leaveGroupHandler(),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 17,
                                        child: Icon(Icons.logout, color: cWarnColor,),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ),
                      )
                      :
                      GestureDetector(
                        onLongPress: () => mainPageController.showGroupCardOptionsHandler(context, idx),
                        child: GroupCard(idx: idx,)
                      ),
                    ),
                    
                    
                    const SizedBox(height: 8,),
                  ],
                )
            )
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final MainPageController mainPageController = Get.put(MainPageController()); 
    MainPageController mainPageController = Get.put(MainPageController())..initializeController(context);
    
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
        title: Text(mainPageController.pageTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => mainPageController.openMorePopupHandler(context),  
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                const SizedBox(height: cDefaultPadding),
                
                Container(
                  width: size.width,
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: mainPageController.chatCategory.asMap().map((idx, item) => MapEntry(idx, 
                        GestureDetector(
                          onTap: () => mainPageController.updateChatCategoryHandler(idx),
                          child: Obx(() => Container(
                            height: 24,
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: mainPageController.enableCategory.value == idx ? Colors.white : cPrimaryColor1,
                              borderRadius: const BorderRadius.all(Radius.circular(12))
                            ),
                            child: Text(
                              item, 
                              style: TextStyle(color: mainPageController.enableCategory.value == idx ? Colors.black : Colors.white, fontSize: cFontSize12, fontWeight: FontWeight.bold)
                            ),
                          )),
                        ),
                      )).values.toList(),
                    ),
                ),

                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Obx(() => mainPageController.enableCategory.value == 0 ? contactBody(mainPageController, context)
                      : 
                      mainPageController.enableCategory.value == 1 ? groupBody(mainPageController, context) : const SizedBox()),
                      
                    ],
                  ) 
                ),

              ],
            ),
            
          ],
        )
      ),

      floatingActionButton: Obx(() => mainPageController.enableCategory.value == 0 ? SizedBox(
        width: 54,
        height: 54,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: navigateNewChatPageHandler,
            backgroundColor: cPrimaryColor1,
            child: const Icon(
              Icons.border_color_outlined,
              color: Colors.white,
            ),
          ),
        ),
      )
      :
      SizedBox(
        width: 54,
        height: 54,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: navigateNewChatPageHandler,
            backgroundColor: cPrimaryColor1,
            child: const Icon(
              Icons.group_add,
              color: Colors.white,
            ),
          ),
        ),
      )
    ));
  }

}


// class _MessengerMainPageState extends State<MessengerMainPage> {
  

//   @override
//   void initState() {
//     super.initState();
//     _routeTransitionTypeList
//     ..add(RouteTransitionType(title: 'Default', transitionType: TransitionType.defaultTransition))
//     ..add(RouteTransitionType(title: 'No Transition', transitionType: TransitionType.none))
//     ..add(RouteTransitionType(title: 'Size Transition', transitionType: TransitionType.size))
//     ..add(RouteTransitionType(title: 'Scale Transition', transitionType: TransitionType.scale))
//     ..add(RouteTransitionType(title: 'Fade Transition', transitionType: TransitionType.fade))
//     ..add(RouteTransitionType(title: 'Rotate Transition', transitionType: TransitionType.rotate))
//     ..add(RouteTransitionType(title: 'Slide Up Transition', transitionType: TransitionType.slideUp))
//     ..add(RouteTransitionType(title: 'Slide Down Transition', transitionType: TransitionType.slideDown))
//     ..add(RouteTransitionType(title: 'Slide Left Transition', transitionType: TransitionType.slideLeft))
//     ..add(RouteTransitionType(title: 'Slide Right Transition', transitionType: TransitionType.slideRight));
//   }

  
// }
