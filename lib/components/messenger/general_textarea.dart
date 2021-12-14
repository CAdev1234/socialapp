import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';

class GeneralTextArea extends StatefulWidget {
  GeneralTextArea({Key? key}) : super(key: key);


  @override
  State<GeneralTextArea> createState() => _GeneralTextAreaState();
}


class _GeneralTextAreaState extends State<GeneralTextArea> {
  
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: TextField(
        minLines: 5,
        maxLines: 20,
        maxLength: 200,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cInputBorderColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: cPrimaryColor2, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        style: TextStyle(fontSize: cFontSize14),
      ),
    );
  }
}