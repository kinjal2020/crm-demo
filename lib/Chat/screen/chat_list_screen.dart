import 'package:carparking/Auth/provider/auth_provider.dart';
import 'package:carparking/Chat/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Home/Employee/model/employee_model.dart';
import '../../Home/Employee/provider/employee_provider.dart';
import '../../util/color.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final empProvider = Provider.of<EmployeeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Chat Support',
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
        ),
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
      ),
      body: FutureBuilder(
          future: empProvider.getEmployees(),
          builder: (context, AsyncSnapshot<List<EmployeeModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data!.isNotEmpty) {
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          String roomId = chatRoomId(
                              authProvider.doc!.docs[0]['employeeFirstName'],
                              snapshot.data![index].employeeFirstName!);

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                    empName: snapshot
                                        .data![index].employeeFirstName!,
                                    chatRoomId: roomId,
                                  )));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              snapshot.data![index].employeeImage!,
                            ),
                          ),
                          title: Text(snapshot.data![index].employeeFirstName!,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          subtitle: Text(snapshot.data![index].employeeId!,
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: grayColor.withOpacity(0.1),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text(
                    'No Employees Available',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
            }
          }),
    );
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }
}
