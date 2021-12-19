import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';

class GeneralInput extends StatefulWidget {
  GeneralInput({Key? key, required this.inputHeight }) : super(key: key);

  double inputHeight;

  @override
  State<GeneralInput> createState() => _GeneralInputState();
}


class _GeneralInputState extends State<GeneralInput> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.inputHeight,
      child: const TextField(
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