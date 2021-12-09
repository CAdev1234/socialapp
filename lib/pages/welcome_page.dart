import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/pages/messenger/main_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MessengerMainPage())), 
              child: Column(
                children: const [
                  Text(
                    'Go to messenger',
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