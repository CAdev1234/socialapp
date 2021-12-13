import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';

class MsgCard extends StatelessWidget {
  MsgCard({Key? key, required this.isMine, required this.text, required this.createdAt}) : super(key: key);
  bool isMine = false;
  String text = '';
  String createdAt = '';

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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isMine ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: cMainFontSize
            ),
          ),
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