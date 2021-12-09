import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color;
  final EdgeInsets padding;

  const PrimaryButton({
    required Key key,
    required this.text,
    required this.press,
    this.color = cPrimaryColor,
    this.padding = const EdgeInsets.all(cDefaultPadding * 0.75)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
      padding: padding,
      color: color,
      minWidth: double.infinity,
      onPressed: press,
      child: Text(
        text, style: TextStyle(color: Colors.white)
      ),
    );
  }
  
}