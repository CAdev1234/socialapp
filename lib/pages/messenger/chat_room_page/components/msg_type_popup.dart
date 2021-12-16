import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';

class MsgTypePopupBody extends StatelessWidget {
  const MsgTypePopupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: cDefaultPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: size.width - 20,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(Icons.camera_alt, color: Colors.black, size: 20),
                          SizedBox(width: 13),
                          Text(
                            "Camera",
                            style: TextStyle(color: Colors.black, fontSize: cFontSize14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(Icons.image, color: Colors.black, size: 20),
                          SizedBox(width: 13),
                          Text(
                            "Media",
                            style: TextStyle(color: Colors.black, fontSize: cFontSize14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(Icons.text_snippet_sharp, color: Colors.black, size: 20),
                          SizedBox(width: 13),
                          Text(
                            "Document",
                            style: TextStyle(color: Colors.black, fontSize: cFontSize14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(Icons.qr_code, color: Colors.black, size: 20),
                          SizedBox(width: 13),
                          Text(
                            "Share QR",
                            style: TextStyle(color: Colors.black, fontSize: cFontSize14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width - 20,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all((Radius.circular(10)))
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: cWarnColor,
                      fontSize: cFontSize14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ]
          )
        )
      ],
    );
  }
}