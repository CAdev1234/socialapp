import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:socialapp/constants.dart';

class FirebaseService {
  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: "Something Wrong.",
          content: const Text(
            "No user found for that email.",
            style: TextStyle(fontSize: cFontSize12),
          ),
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: "Something Wrong.",
          content: const Text(
            "Wrong password provided for that user.",
            style: TextStyle(fontSize: cFontSize12),
          ),
        );
      }
    }
  }

  Future<void> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      Get.defaultDialog(
        title: "Successful",
        content: const Text(
          "Please go to signin page and sign in.",
          style: TextStyle(fontSize: cFontSize12),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: "Something Wrong!",
          content: const Text(
            "The password provided is too weak.",
            style: TextStyle(fontSize: cFontSize12),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: "Something Wrong!",
          content: const Text(
            "The account already exists for that email.",
            style: TextStyle(fontSize: cFontSize12),
          ),
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Something Wrong!",
        content: Text(
          e.toString(),
          style: const TextStyle(fontSize: cFontSize12),
        ),
      );
    }
  }

  // Future<void> signOut() async {
  //   try {
  //     await
  //   } catch (e) {
  //   }
  // }
}