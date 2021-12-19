import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:socialapp/pages/messenger/main_page/controller/main_page_controller.dart';
import 'package:socialapp/pages/messenger/main_page/main_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  MainPageController mainPageController = MainPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Welcome')),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset("assets/images/welcome.png"),
            const Spacer(flex: 3),
            Text(
              'Welcome to our freedom\n messaging app', 
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold, color: Colors.black54)
            ),
            const Spacer(),
            Text(
              "Freedom talk any person of your\n mother language.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const MessengerMainPage()));
                // Get.to(() => MessengerMainPage());
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ShowCaseWidget(
                      builder: Builder(
                        builder: (_) => MessengerMainPage(),
                      ),
                      onFinish: () => mainPageController.closeMsgCardOptionsHandler(),
                    )
                  )
                ).then((value) => {
                  
                });
              }, 
              child: Column(
                children: const [
                  Text(
                    'Go to Messenger App',
                    textAlign: TextAlign.center,
                  )
                ],
                )
              )
          ],
        ),
      ),
    );
  }
}