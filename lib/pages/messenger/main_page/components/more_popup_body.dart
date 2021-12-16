import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/pages/messenger/profile/profile_page.dart';

class MorePopupBody extends StatelessWidget {
  const MorePopupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size.width - 20,
            decoration: const BoxDecoration(
              color:Colors.white, 
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => ProfilePage()
                            )
                          ).then((value) => {
                            
                          });
                        } ,
                        child: Row(
                          children: const [
                            Icon(Icons.person, color: Colors.black, size: 20),
                            SizedBox(width: 13),
                            Text(
                              "View My Profile",
                              style: TextStyle(color: Colors.black, fontSize: cFontSize14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Icon(Icons.snooze_sharp, color: Colors.black, size: 20),
                            SizedBox(width: 13),
                            Text(
                              "Snooze",
                              style: TextStyle(color: Colors.black, fontSize: cFontSize14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Icon(Icons.storage, color: Colors.black, size: 20),
                            SizedBox(width: 13),
                            Text(
                              "Backup Data",
                              style: TextStyle(color: Colors.black, fontSize: cFontSize14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Icon(Icons.delete, color: Colors.black, size: 20),
                            SizedBox(width: 13),
                            Text(
                              "Delete All Chats",
                              style: TextStyle(color: Colors.black, fontSize: cFontSize14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Icon(Icons.person, color: Colors.black, size: 20),
                            SizedBox(width: 13),
                            Text(
                              "Export All Chat",
                              style: TextStyle(color: Colors.black, fontSize: cFontSize14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ]
                  ) 
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                      child: Container(
                      width: 18,
                      height: 18,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: cIconColor,
                        shape: BoxShape.circle
                      ),
                      child: const Icon(Icons.close, size: 16, color: Colors.white)
                    ),
                  )
                ),
              ]
            ),
          )
        ]
      )
    );
  }
}
