import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';

class RadioGroup extends StatefulWidget {
  RadioGroup({
    Key? key, 
    required List this.radioList,
    required double this.radioSize,
    required Color this.activeBorderColor,
    required Color this.inactiveBorderColor,
    required Color this.activeColor,
    required Color this.inactiveColor,
    required int this.value,
    required int this.groupValue,
    double? this.contentMargin,
  }) : super(key: key);
  List radioList;
  double radioSize;
  Color activeBorderColor;
  Color inactiveBorderColor;
  Color activeColor;
  Color inactiveColor;
  int value;
  int groupValue;
  double? contentMargin;

  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {

  int _indexValue = 0;

  @override
  void initState() {
    _indexValue = widget.value;
  }

  void updateIndexValueHandler(int idx) {
    setState(() {
      _indexValue = idx;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.radioList.asMap().map((idx, item) => MapEntry(idx,
        GestureDetector(
          onTap: () => updateIndexValueHandler(idx),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: widget.radioSize,
                height: widget.radioSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: _indexValue == idx ? widget.activeBorderColor : widget.inactiveBorderColor, width: 2),
                  shape: BoxShape.circle
                ),
                child: CircleAvatar(
                  radius: widget.radioSize / 2 - 4,
                  backgroundColor: _indexValue == idx ? widget.activeColor : widget.inactiveColor,
                ),
              ),
              Text(
                item,
                style: const TextStyle(color: Colors.black, fontSize: cFontSize14, fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      )).values.toList(),
    );
  }
}