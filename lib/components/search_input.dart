import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';


class SearchInput extends StatelessWidget{

  
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 38,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: C_DefaultPadding * 0.75),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: C_InputBorderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: TextField(
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(color: C_IconColor, fontSize: 12),
                    icon: Icon(
                      Icons.search,
                      size: 20,
                      color: C_IconColor,
                      
                    )
                  ),

                ),
            );
  }
}