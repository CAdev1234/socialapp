import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';

// type: when its value is "person", person icon
//      when its value is "group", group icon 
class EmptyAvatar extends StatelessWidget {
  EmptyAvatar({
    Key? key, 
    required this.avatarType,
    required this.radius
  }) : super(key: key);

  String avatarType;
  double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: cContentDisableColor,
      child: Icon(avatarType == 'person' ? Icons.person : Icons.group, color: Colors.white, size: radius * 1.4,),
    );
  }
}