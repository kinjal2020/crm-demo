import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../util/color.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Josheph',
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
        ),
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment:
                      (index % 2 == 0 ? Alignment.topLeft : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (index % 2 == 0
                          ? grayColor.withOpacity(0.3)
                          : primaryColor),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Hello',
                      style: TextStyle(
                          fontSize: 15,
                          color: (index % 2 != 0) ? whiteColor : blackColor),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send,
                      color: primaryColor,
                      size: 18,
                    ),
                    // backgroundColor: primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
