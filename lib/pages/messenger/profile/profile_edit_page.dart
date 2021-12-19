import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/components/messenger/datepicker_input.dart';
import 'package:socialapp/components/messenger/general_input.dart';
import 'package:socialapp/components/messenger/general_textarea.dart';
import 'package:socialapp/components/messenger/password_input.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/pages/messenger/profile/controller/profile_edit_page_controller.dart';

class ProfileEditPage extends StatelessWidget {
  
  ProfileEditPage({Key? key}) : super(key: key);

  ProfileEditPageController pageController = Get.put(ProfileEditPageController());

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 7, right: 7, bottom: cDefaultPadding * 0.75, top: 7),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: cDefaultPadding, right: cDefaultPadding, top: cDefaultPadding * 1.2, bottom: cDefaultPadding * 0.7 ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: cBoxShadow
                  ),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Row(
                        children: const [
                          Text(
                            "First Name",
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
                      GeneralInput(inputHeight: 38,),

                      const SizedBox(height: 17,),
                      Row(
                        children: const [
                          Text(
                            "Last Name",
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
                      GeneralInput(inputHeight: 38),

                      const SizedBox(height: 17,),
                      Row(
                        children: const [
                          Text(
                            "Username",
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
                      GeneralInput(inputHeight: 38),

                      const SizedBox(height: 17,),
                      Row(
                        children: const [
                          Text(
                            "Email ID",
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
                      GeneralInput(inputHeight: 38),

                      const SizedBox(height: 17,),
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
                      const PasswordInput(),

                      const SizedBox(height: 17,),
                      Row(
                        children: const [
                          Text(
                            "Date of birth",
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
                      DatePickerInput(inputHeight: 38,),

                      const SizedBox(height: 17,),
                      Row(
                        children: const [
                          Text(
                            "Mobile Number",
                            style: TextStyle(color: Colors.black, fontSize: cFontSize12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      GeneralInput(inputHeight: 38),

                      const SizedBox(height: 17,),
                      Row(
                        children: const [
                          Text(
                            "Select Country",
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
                      GeneralInput(inputHeight: 38),

                      const SizedBox(height: 17,),
                      Row(
                        children: const [
                          Text(
                            "Bio",
                            style: TextStyle(color: Colors.black, fontSize: cFontSize12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      GeneralTextArea(),


                    ],
                  ),
                )
              ),
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.only(bottom: 16, left: cDefaultPadding * 1.3, right: cDefaultPadding * 1.3),
              decoration: const BoxDecoration(
                color: Colors.white
              ),
              child: MaterialButton(
                onPressed: () {
                  Get.toNamed('/messenger/profile/profile_complete_page');
                },
                color: cPrimaryColor1,
                height: 38,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  "Apply",
                  style: TextStyle(color: Colors.white, fontSize: cFontSize12, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            
          ],
        ) 
      )
    );
  }
}