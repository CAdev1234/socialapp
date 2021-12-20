import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/utils/reg_exp.dart';

enum InputFieldType {name, email, number}

class GeneralInput extends StatefulWidget {
  GeneralInput({
    Key? key, 
    required this.inputHeight,
    @required this.callback,
    required this.field 
  }) : super(key: key);

  double inputHeight;
  InputFieldType field;
  final Function(String)? callback;

  @override
  State<GeneralInput> createState() => _GeneralInputState();
}


class _GeneralInputState extends State<GeneralInput> {

  String currentVal = '';
  bool enableValidate = false;

  void updateHandler(String str) {
    setState(() {
      currentVal = str;
      enableValidate = true;
    });
    widget.callback!(str);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.inputHeight,
          child: TextField(
            decoration: const InputDecoration(
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
            style: const TextStyle(fontSize: cFontSize14),
            onChanged: (value) => updateHandler(value),
          ),
        ),
        if (enableValidate && !validateEmail(currentVal) && widget.field == InputFieldType.email) Text("Invalid Email.", style: TextStyle(color: cWarnColor, fontSize: cFontSize12),)
      ],
    );
  }
}