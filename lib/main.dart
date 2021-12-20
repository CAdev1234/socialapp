import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialapp/pages/messenger/auth_page/signin_page/signin_page.dart';
import 'package:socialapp/pages/messenger/auth_page/signup_page/signup_page.dart';
import 'package:socialapp/pages/messenger/main_page/main_page.dart';
import 'package:socialapp/pages/messenger/new_chat_page/new_chat_page.dart';
import 'package:socialapp/pages/messenger/profile/profile_complete_page.dart';
import 'package:socialapp/pages/messenger/profile/profile_edit_page.dart';
import 'package:socialapp/pages/messenger/profile/profile_img_page.dart';
import 'package:socialapp/pages/messenger/profile/profile_page.dart';
import 'package:socialapp/pages/messenger/security/security_page.dart';
// import 'package:socialapp/pages/messenger/profile/profile_complete_page.dart';
import 'package:socialapp/theme.dart';
import 'pages/messenger/home_page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Social App',
      // theme: lightThemeData(context),
      theme:ThemeData(
       textTheme: GoogleFonts.poppinsTextTheme(
           Theme.of(context).textTheme,
       )
      ),
      darkTheme: darkThemeData(context),
      home: SignInPage(),
      
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SignInPage()),
        GetPage(name: '/messenger/signup', page: () => SignUpPage()),
        GetPage(name: '/messenger/home_page', page: () => HomePage()),
        GetPage(name: '/messenger/main_page', page: () => MessengerMainPage()),
        GetPage(name: '/messenger/new_chat_page', page: () => NewChatPage()),
        // GetPage(name: '/messenger/chat_room_page', page: () => ChatRoomPage()),

        //profile page
        GetPage(name: '/messenger/profile/profile_page', page: () => ProfilePage()),
        GetPage(name: '/messenger/profile/profile_edit_page', page: () => ProfileEditPage()),
        GetPage(name: '/messenger/profile/profile_complete_page', page: () => ProfileCompletePage()),
        GetPage(name: '/messenger/profile/profile_img_page', page: () => ProfileImagePage()),

        //privacy & securty page
        GetPage(name: '/messenger/security/security_page', page: () => SecurityPage())
      ],
    );
  }
}
