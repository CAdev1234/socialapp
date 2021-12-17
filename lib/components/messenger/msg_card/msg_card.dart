import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialapp/components/messenger/msg_card/msg_card_controller.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/models/chat_message.dart';
import 'package:socialapp/models/contact.dart';

class MsgCard extends StatelessWidget {
  MsgCard({
    Key? key, 
    required this.isMine, 
    required this.text, 
    required this.createdAt,
    required this.messageActionStatus,
    required this.userContact
  }) : super(key: key);

  bool isMine = false;
  String text = '';
  String createdAt = '';
  MessageActionStatus messageActionStatus;
  Contact userContact;

  MsgCardController msgCardController = Get.put(MsgCardController());


  Widget repliedPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.redo, size: 20, color: Color.fromRGBO(255, 255, 255, 0.6)),
            SizedBox(width: 6,),
            Text(
              "Reply",
              style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6), fontSize: cFontSize10, fontStyle: FontStyle.italic),
            ),
          ],
        ),
        const Text(
          "I'm doing good, thank you",
          style: TextStyle(fontSize: cFontSize10, color: Color.fromRGBO(255, 255, 255, 0.6), fontStyle: FontStyle.italic),
        ),
        const Divider(height: 10, color: Colors.red, thickness: 1,)
      ],
    );
  }
  Widget forwardedPart() {
    return Column(
      children: [
        Row(
          children: const [
            Icon(Icons.redo, size: 20, color: Color.fromRGBO(255, 255, 255, 0.6)),
            SizedBox(width: 6,),
            Text(
              "Forwarded",
              style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6), fontSize: cFontSize10, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ],
    );
  }
  Widget deletedPart() {
    return Row(
      children: const [
        Icon(Icons.delete, color: cContentDisableColor, size: 16,),
        SizedBox(width: 5,),
        Text(
          "The message has been deleted",
          style: TextStyle(color: cContentDisableColor, fontSize: cFontSize10),
        )
      ]
    );
  }
  Widget markedPart() {
    return Column(
      children: [
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(userContact.image),
              radius: 9,
            ),
            const SizedBox(width: 10,),
            Text(
              '${userContact.firstname} ${userContact.lastname}',
              style: TextStyle(fontSize: cFontSize12, fontWeight: FontWeight.w600, color: isMine ? Colors.black : Colors.white),
            ),
            
            const CircleAvatar(
              backgroundColor: cPrimaryColor2,
              radius: 10,
              child: Icon(Icons.bookmark, color: Colors.white, size: 12,)
            ),
            
          ],
        ),
        const Divider(height: 10,)
      ],
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 9, bottom: 6, right: 14, left: 14),
      decoration: BoxDecoration(
        color: isMine ? Colors.white : cPrimaryColor2,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: cBoxShadow
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (messageActionStatus == MessageActionStatus.replied) repliedPart(),
          if (messageActionStatus == MessageActionStatus.forwarded) forwardedPart(),
          if (messageActionStatus == MessageActionStatus.deleted) deletedPart(),
          if (messageActionStatus == MessageActionStatus.marked) markedPart(),
          messageActionStatus != MessageActionStatus.deleted ? Text(
            text,
            style: TextStyle(
              color: isMine ? Colors.black : Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: cFontSize14
            ),
          ) : const SizedBox(width: 0,),
          Text(
            createdAt,
            style: TextStyle(
              color: isMine ? cContentDisableColor : Colors.white,
              fontSize: 10,
            ), 
          ),
          
        ],
      ),
    );
  }

}