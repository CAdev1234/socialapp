import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'package:socialapp/components/messenger/general_input.dart';
import 'package:socialapp/components/messenger/password_input.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/pages/messenger/auth_page/signin_page/controller/signin_page_controller.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  SignInPageController pageController = SignInPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign In", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: cDefaultPadding, vertical: 0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Email",
                        style: TextStyle(color: Colors.black, fontSize: cFontSize12),
                      ),
                      SizedBox(width: 2,),
                      Text(
                        "*",
                        style: TextStyle(color: cWarnColor, fontSize: cFontSize12),
                      )
                    ],
                  ),
                  const SizedBox(height: 8,),
                  GeneralInput(
                    inputHeight: 38,
                    field: InputFieldType.email,
                    callback: (val) => pageController.setEmailHandler(val)),
                  const SizedBox(height: 20),

                  Row(
                    children: const [
                      Text(
                        "Password",
                        style: TextStyle(color: Colors.black, fontSize: cFontSize12),
                      ),
                      SizedBox(width: 2,),
                      Text(
                        "*",
                        style: TextStyle(color: cWarnColor, fontSize: cFontSize12),
                      )
                    ],
                  ),
                  const SizedBox(height: 8,),
                  PasswordInput(inputHeight: 38, callback:(val) => pageController.setPasswordHandler(val)),

                  const SizedBox(height: 50),
                  MaterialButton(
                    onPressed: () => pageController.signInHandler(context),
                    color: cPrimaryColor1,
                    height: 38,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      child: const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 15),),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account?"),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {Get.toNamed('/messenger/signup');},
                        child: const Text("Register here.", style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}