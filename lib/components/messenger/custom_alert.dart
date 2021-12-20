import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';

class CustomAlert extends StatelessWidget {

  CustomAlert({Key? key, required this.title, required this.content}) : super(key: key);

  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    Size size =  MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(cDefaultPadding),
            width: size.width - 20,
            decoration: const BoxDecoration(
              color:Colors.white, 
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
                ),
                const SizedBox(height: 20,),
                Text(
                  content,
                  style: const TextStyle(fontSize: 12, color: Colors.black, decoration: TextDecoration.none),
                )
              ],
            ),
          )
        ]
      )
    );
  }
}