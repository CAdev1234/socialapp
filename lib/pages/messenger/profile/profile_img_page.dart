import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/pages/messenger/profile/controller/profile_image_page_controller.dart';

class ProfileImagePage extends StatelessWidget{
  ProfileImagePage({Key? key}) : super(key: key);

  ProfileImagePageController pageController = Get.put(ProfileImagePageController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cPrimaryColor1,
      appBar: AppBar(
        backgroundColor: cPrimaryColor1,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios,size: cFontSize16),
              alignment: const Alignment(0, 0.0), // move icon a bit to the left
            );
          },
        ),
        title: Text(pageController.pageTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Jillian MacNab",
              style: TextStyle(fontSize: cFontSize18, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            const Text(
              "@jillian_macnab",
              style: TextStyle(fontSize: cFontSize10, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(height: 30, ),
            Container(
              width: size.width - cDefaultPadding * 1.5 * 2,
              height: size.width - cDefaultPadding * 1.5 * 2,
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset("assets/images/user1.jpg"),
            ),
            const SizedBox(height: 48,),
            
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 24,
                width: 102,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: const Text(
                  "Save Picture",
                  style: TextStyle(fontSize: cFontSize12, color: Colors.white, decoration: TextDecoration.none),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }  
}

