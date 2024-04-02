import 'package:carparking/Home/Task/manage_task.dart';
import 'package:carparking/Home/Task/model/task_model.dart';
import 'package:carparking/Home/Task/provider/task_provider.dart';
import 'package:carparking/main.dart';
import 'package:carparking/util/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String role = '';

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    role = pref.getString('role') ?? '';
    setState(() {});
    print(role);
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                  (route) => false);
            },
            icon: Icon(CupertinoIcons.back)),
        title: Text(
          'Task List',
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
        ),
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: taskProvider.getTask(),
            builder: (context, AsyncSnapshot<List<TaskModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              if (role == 'hr') {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ManageTaskScreen(
                                          taskId: snapshot.data![index].taskId!,
                                          taskName:
                                              snapshot.data![index].taskName!,
                                          taskCode:
                                              snapshot.data![index].taskCode!,
                                          assignTo:
                                              snapshot.data![index].assignTo!,
                                          managerName: snapshot
                                              .data![index].managerName!,
                                          currentStatus: snapshot
                                              .data![index].currentStatus!,
                                          assignDate:
                                              snapshot.data![index].assignDate!,
                                          endDate:
                                              snapshot.data![index].endDate!,
                                          timeTaken:
                                              snapshot.data![index].timeTaken!,
                                          index: index,
                                        )));
                              }
                            },
                            child: Container(
                              // height: 130,
                              width: 270,
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: secondaryColor.withOpacity(0.2),
                                        spreadRadius: 0.2,
                                        blurRadius: 9)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].taskCode!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          snapshot.data![index].taskName!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18),
                                        ),
                                        Text(snapshot.data![index].assignTo!),
                                        Text(
                                            snapshot.data![index].managerName!),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: errorColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              snapshot
                                                  .data![index].currentStatus!,
                                              style:
                                                  TextStyle(color: whiteColor),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Due By: ${snapshot.data![index].endDate!}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: grayColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Text('No Task Available',style: TextStyle(color: Colors.grey),),
                  );
                }
              }
            }),
      ),
    );
  }
}
