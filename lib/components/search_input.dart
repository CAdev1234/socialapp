import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';


class SearchInput extends StatelessWidget{

  
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 38,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: cDefaultPadding * 0.75),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: cInputBorderColor),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: TextField(
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(color: cIconColor, fontSize: 12),
                    icon: Icon(
                      Icons.search,
                      size: 20,
                      color: cIconColor,
                      
                    )
                  ),

                ),
            );
  }
}