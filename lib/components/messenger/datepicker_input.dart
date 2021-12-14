import 'package:flutter/material.dart';
import 'dart:async';
import 'package:socialapp/constants.dart';

class DatePickerInput extends StatefulWidget {
  DatePickerInput({Key? key, required double this.inputHeight}) : super(key: key);

  double inputHeight;

  @override
  State<DatePickerInput> createState() => _DatePickerInputState();
}


class _DatePickerInputState extends State<DatePickerInput> {

  DateTime _currentDate = DateTime.now();

  Future<void> _selectDateHandler(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context, 
      initialDate: _currentDate, 
      firstDate: DateTime(1960), 
      lastDate: DateTime(2050)
    );
    if (selectedDate != null && selectedDate != _currentDate) {
      setState(() {
        _currentDate = selectedDate;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.inputHeight,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: cInputBorderColor),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${_currentDate.month.toString()}/${_currentDate.day.toString()}/${_currentDate.year.toString()}'),
          IconButton(
            onPressed: () => _selectDateHandler(context), 
            icon: const Icon(Icons.date_range, size: 18,)
          ),
        ],
      )
    );
  }
}