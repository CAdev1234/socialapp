import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';


class CustomTabBar extends StatefulWidget {
  CustomTabBar({
    Key? key, 
    required this.tabList, 
    required this.activeColor, 
    required this.inactiveColor,
    required this.activeBg,
    required this.inactiveBg,
  });
  final List tabList;
  final Color activeBg;
  final Color inactiveBg;
  final Color activeColor;
  final Color inactiveColor;
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;
  

  
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 24.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.tabList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            height: 24,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: cDefaultPadding * 0.6),
            decoration: BoxDecoration(
              color: index == selectedIndex ? widget.activeBg : widget.inactiveBg, 
              borderRadius: BorderRadius.circular(30)
            ),
            child: Text(
              widget.tabList[index],
              style: TextStyle(
                fontWeight: index == selectedIndex ? FontWeight.bold : FontWeight.w600,
                color: index == selectedIndex ? widget.activeColor : widget.inactiveColor
              ),
            )
          ),
        )
      ),
    );
  }
}