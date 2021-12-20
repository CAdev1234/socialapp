import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/constants.dart';
import 'package:socialapp/models/chat_group.dart';

class GroupCard extends StatelessWidget {
  GroupCard({
    Key? key,
    required this.idx
  }) : super(key: key);

  int idx;

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: cBoxShadow
      ),
      child: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                backgroundColor: cInputBorderColor,
                radius: 25,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: demoGroups[idx].type == ChatGroupType.private ? cLockColor : cActiveColor,
                  child: Icon(demoGroups[idx].type == ChatGroupType.private ? Icons.lock : Icons.lock_open, color: Colors.white, size: 13,),
                ) 
              )
            ]
            
          ),
          
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    '${demoGroups[idx].groupName}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: cFontSize12,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  demoGroups[idx].isVerified ? Container(
                    margin: const EdgeInsets.only(left: 4),
                    alignment: Alignment.center,
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: cPrimaryColor1,
                      shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 10,),
                  ) : const SizedBox(width: 0,)
                ],
              ),
              const Text(
                "Hi, How are you doing",
                style: TextStyle(
                  fontSize: cFontSize12,
                  color: Colors.black
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "3:36 PM",
                  style: TextStyle(
                    color: cPrimaryColor1 ,
                    fontSize: 10,
                    fontWeight: FontWeight.w500
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 8),
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: cWarnColor,
                    shape: BoxShape.circle
                  ),
                  child: const Text(
                    "99+",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9
                    ),
                  ),
                )
              ],
            ) 
          )
        ],
      ),
    );
  }
}