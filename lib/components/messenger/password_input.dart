import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput({Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}


class _PasswordInputState extends State<PasswordInput> {

  bool _isObscure = true;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: TextField(
        obscureText: _isObscure,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: cInputBorderColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: cPrimaryColor2, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            }, 
            icon: _isObscure ? const Icon(Icons.visibility_off, size: 18) : const Icon(Icons.visibility, size: 18,)
          )
        ),
        style: const TextStyle(fontSize: cFontSize14),
      ),
    );
  }
}