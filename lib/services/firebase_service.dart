import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/models/contact.dart';

class FirebaseService {
  Future<void> signInFBWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      // debugPrint(userCredential.user.);
      
      
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

  Future<void> signUpFBWithEmailPassword(String firstname, String lastname, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      debugPrint(userCredential.toString());
      debugPrint(userCredential.user.toString());
      CollectionReference contacts = FirebaseFirestore.instance.collection("contacts");
      contacts.doc(userCredential.user!.uid).set(
        Contact(
          id: userCredential.user!.uid,
          firstname: firstname,
          lastname: lastname,
          email: email,
          password: '',
          username: '',
          birth: '',
          country: '',
          bio: '',
          image: '',
          isVerified: userCredential.user!.emailVerified,
          lastSignedAt: userCredential.user!.metadata.lastSignInTime.toString(),
          createdAt: userCredential.user!.metadata.creationTime.toString(),
          updatedAt: userCredential.user!.metadata.creationTime.toString(),
          deletedAt: '',
          deletedBy: ''
        ).toJson()
      )
      .then((value) => {
        Get.defaultDialog(
          title: "Successful",
          content: const Text(
            "Please go to signin page and sign in.",
            style: TextStyle(fontSize: cFontSize12),
          ),
        )
      })
      .catchError((error) => {
        Get.defaultDialog(
          title: "Something wrong",
          content: Text(
            error.toString(),
            style: const TextStyle(fontSize: cFontSize12),
          ),
        )
      });

      
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

  Future<void> signOutFB() async {
    try {
      await FirebaseAuth.instance.signOut();
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

  Future getFBContacts() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('contacts').get();
      final allContacts = querySnapshot.docs.map((doc) => doc.data()).toList();

      // debugPrint('allContacts= ${allContacts.toString()}');
      return allContacts;
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

  void sendTextMessage(Contact receiver, String txt) {
    FirebaseFirestore.instance.collection("Messages").doc("sample").set({
      'userId': '',
      'text': txt,
      'messageType': 'text',
      'messageStatus': 'viewed',
      'messageActionStatus': 'none',
      'isMine': true,
      'createdAt': DateTime.now().toString()
    });
  }
}