import 'package:carparking/Auth/provider/auth_provider.dart';
import 'package:carparking/Chat/provider/chat_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../util/color.dart';

class ChatScreen extends StatefulWidget {
  final String empName;
  final String chatRoomId;

  const ChatScreen(
      {super.key, required this.empName, required this.chatRoomId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    print(widget.chatRoomId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context, listen: true);
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading:widget.empName =="HR"? Container(): IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.back),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          widget.empName,
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
        ),
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 150,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Chat')
                    .doc(widget.chatRoomId)
                    .collection('chat')
                    .orderBy("createdAt", descending: false)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: 14, right: 14, top: 10, bottom: 10),
                        child: Align(
                          alignment: snapshot.data!.docs[index]['sendBy'] ==
                                  authProvider.doc!.docs[0]['employeeFirstName']
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (index % 2 == 0
                                  ? grayColor.withOpacity(0.3)
                                  : primaryColor),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              snapshot.data!.docs[index]['message'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: (index % 2 != 0)
                                      ? whiteColor
                                      : blackColor),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 70,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      maxLines: 5,
                      controller: messageController,
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
                    onPressed: () async {
                      await chatProvider.sendMessage(
                          messageController.text,
                          widget.chatRoomId,
                          widget.empName,
                          widget.empName == 'HR'
                              ? authProvider.doc!.docs[0]['employeeFirstName']
                              : 'HR');

                      messageController.clear();
                    },
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