import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';

class ChatInput extends StatefulWidget {

  const ChatInput({Key? key, required this.returnFocusState}) : super(key: key);

  // final VoidCallback returnFocusState;
  final Function(bool) returnFocusState;
   
  @override
  State<ChatInput> createState() => _ChatInputState(); 
  
}

class _ChatInputState extends State<ChatInput> {

  final FocusNode _focusNode = FocusNode();
  bool focusedState = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_focusChangeHandler);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_focusChangeHandler);
    _focusNode.dispose();
  }

  void _focusChangeHandler() {
    setState(() {
      focusedState = !focusedState;
    });
    widget.returnFocusState(focusedState);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: TextField(
        focusNode: _focusNode,
        decoration: const InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
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
      ),
    );
  }
}