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


  Widget repliedPart(String repliedText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.redo, 
              size: 20, 
              color: isMine ? cContentDisableColor : const Color.fromRGBO(255, 255, 255, 0.6)
            ),
            const SizedBox(width: 6,),
            Text(
              "Reply",
              style: TextStyle(
                color: isMine ? cContentDisableColor : const Color.fromRGBO(255, 255, 255, 0.6), 
                fontSize: cFontSize10, 
                fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
        Text(
          repliedText,
          style: TextStyle(
            fontSize: cFontSize10, 
            color: isMine ? cContentDisableColor : const Color.fromRGBO(255, 255, 255, 0.6), 
            fontStyle: FontStyle.italic
          ),
        ),
        const Divider(height: 10, color: Colors.red, thickness: 1,)
      ],
    );
  }
  Widget forwardedPart() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.redo, 
              size: 20, 
              color: isMine ? cContentDisableColor : const Color.fromRGBO(255, 255, 255, 0.6)
            ),
            const SizedBox(width: 6),
            Text(
              "Forwarded",
              style: TextStyle(
                color: isMine ? cContentDisableColor : const Color.fromRGBO(255, 255, 255, 0.6), 
                fontSize: cFontSize10, 
                fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget deletedPart() {
    return Row(
      children: [
        Icon(
          Icons.delete, 
          color: isMine ? cContentDisableColor : const Color.fromRGBO(255, 255, 255, 0.6), 
          size: 16
        ),
        const SizedBox(width: 5,),
        Text(
          "The message has been deleted",
          style: TextStyle(
            color: isMine ? cContentDisableColor : const Color.fromRGBO(255, 255, 255, 0.6), 
            fontSize: cFontSize10
          ),
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
              style: TextStyle(fontSize: cFontSize12, fontWeight: FontWeight.w600, color: isMine ? cContentDisableColor : const Color.fromRGBO(255, 255, 255, 0.6)),
            ),
            const SizedBox(width: 10,),
            CircleAvatar(
              backgroundColor: isMine ? cPrimaryColor2 : cPrimaryColor1,
              radius: 10,
              child: const Icon(Icons.bookmark, color: Colors.white, size: 12,)
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
          if (messageActionStatus == MessageActionStatus.replied) repliedPart("I am doing good."),
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