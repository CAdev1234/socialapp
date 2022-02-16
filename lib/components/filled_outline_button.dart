import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';


class FilledOutlineButton extends StatelessWidget {
  final String text;
  final bool isFilled;
  final VoidCallback press;

  const FilledOutlineButton({
    Key? key,
    required this.text,
    required this.isFilled,
    required this.press
  });


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30) 
      ),
      elevation: isFilled ? 2 : 0,
      color: isFilled ? Colors.white : Colors.transparent,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          color: isFilled ? Colors.black : Colors.white,
          fontSize: cFontSize12,
          fontWeight: isFilled ? FontWeight.bold : FontWeight.w400
        ),
      ),
    );
  }
}