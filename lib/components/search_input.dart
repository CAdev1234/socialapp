import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';


class SearchInput extends StatelessWidget{

  const SearchInput({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 38,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: cDefaultPadding * 0.5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: cInputBorderColor),
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: const TextField(
                style: TextStyle(fontSize: cFontSize12),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: cIconColor, fontSize: cFontSize12),
                  prefixIcon: Icon(Icons.search, size: 20, color: cIconColor,),
                  prefixIconConstraints: BoxConstraints(maxWidth: 40)
                ),

              ),
            );
  }
}