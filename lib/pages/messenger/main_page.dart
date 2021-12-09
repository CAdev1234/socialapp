import 'package:flutter/material.dart';
import 'package:messenger/components/custom_tab_bar.dart';
import 'package:messenger/components/search_input.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/models/transitions.dart';
import 'new_chat_page.dart';


class RouteTransitionType {
  String title;
  TransitionType transitionType;

  RouteTransitionType({required this.title, required this.transitionType});
}


class MessengerMainPage extends StatefulWidget {
  const MessengerMainPage({Key? key}) : super(key: key);

  final String pageTitle = "Messenger";
  final String transitionStr = "Default";
  @override
  State<MessengerMainPage> createState() => _MessengerMainPageState();
}


class _MessengerMainPageState extends State<MessengerMainPage> {
  List chatCategory = ['Contacts', 'Groups', 'Communities', 'Others'];
  List chatTypeList = ['Primary', 'General', 'Requests'];
  final List _routeTransitionTypeList = [];

  @override
  void initState() {
    super.initState();
    _routeTransitionTypeList
    ..add(RouteTransitionType(title: 'Default', transitionType: TransitionType.defaultTransition))
    ..add(RouteTransitionType(title: 'No Transition', transitionType: TransitionType.none))
    ..add(RouteTransitionType(title: 'Size Transition', transitionType: TransitionType.size))
    ..add(RouteTransitionType(title: 'Scale Transition', transitionType: TransitionType.scale))
    ..add(RouteTransitionType(title: 'Fade Transition', transitionType: TransitionType.fade))
    ..add(RouteTransitionType(title: 'Rotate Transition', transitionType: TransitionType.rotate))
    ..add(RouteTransitionType(title: 'Slide Up Transition', transitionType: TransitionType.slideUp))
    ..add(RouteTransitionType(title: 'Slide Down Transition', transitionType: TransitionType.slideDown))
    ..add(RouteTransitionType(title: 'Slide Left Transition', transitionType: TransitionType.slideLeft))
    ..add(RouteTransitionType(title: 'Slide Right Transition', transitionType: TransitionType.slideRight));
  }

  void _moreActionHandler() {

  }

  void _navigateNewChatPageHandler() {
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
    if (widget.transitionStr == 'Default') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const NewChatPage()
        )
      ).then((value) => {
        
      });
    }else {
      Navigator.of(context).push(
        Transitions(
            // transitionType: _routeTransitionTypeList[0].transitionType,
            transitionType: (_routeTransitionTypeList.where((item) => item.title == widget.transitionStr).toList())[0].transitionType,
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceInOut,
            reverseCurve: Curves.fastOutSlowIn,
            widget: const NewChatPage()
        ),
      ).then((value) => {
      });
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
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
          children: <Widget>[
            const SizedBox(height: C_DefaultPadding),
            Container(
              alignment: Alignment.center,
              child: CustomTabBar(tabList: chatCategory, activeColor: Colors.black, inactiveColor: Colors.white, activeBg: Colors.white, inactiveBg: C_PrimaryColor),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: C_DefaultPadding * 0.8),
                    padding: const EdgeInsets.only(top: C_DefaultPadding * 0.8),
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25))),
                    child: Column(
                      children: [
                        CustomTabBar(tabList: chatTypeList, inactiveColor: Colors.black, activeColor: Colors.white, activeBg: C_PrimaryColor, inactiveBg: Colors.white),
                        const SizedBox(height: C_DefaultPadding),
                        const Text(
                          '000 UNREAD MESSAGES',
                          style: TextStyle(color: C_PrimaryColor, fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: C_DefaultPadding * 0.4,
                            left: C_DefaultPadding,
                            right: C_DefaultPadding,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: C_DefaultPadding * 0.75),
                                  child: SearchInput(),
                                )
                              ),
                              const Icon(Icons.tune)
                            ],
                          ),
                        ),
                        
                        
                        
                      ],
                    ),
                  )
                ],
              ) 
            ),
          ],
        ),
      ),

      floatingActionButton: SizedBox(
        width: 54,
        height: 54,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: _navigateNewChatPageHandler,
            backgroundColor: C_PrimaryColor,
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
