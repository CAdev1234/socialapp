import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:socialapp/components/search_input.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/models/transition_type.dart';
import 'package:socialapp/models/contact.dart';
import 'package:socialapp/pages/messenger/main_page/controller/main_page_controller.dart';


class RouteTransitionType {
  String title;
  TransitionType transitionType;

  RouteTransitionType({required this.title, required this.transitionType});
}


class MessengerMainPage extends StatelessWidget {
  MessengerMainPage({Key? key}) : super(key: key);

  
  final String transitionStr = "Default";
  final MainPageController mainPageController = Get.put(MainPageController());

  

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
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final MainPageController mainPageController = Get.put(MainPageController()); 
    
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
                          // onTap: () => mainPageController.updateChatCategoryHandler(idx),
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
                      Container(
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
                      )
                    ],
                  ) 
                ),

              ],
            ),
            
          ],
        )
      ),

      floatingActionButton: SizedBox(
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
    );
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
