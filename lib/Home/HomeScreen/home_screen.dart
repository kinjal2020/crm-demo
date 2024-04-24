import 'dart:async';
import 'dart:io';

import 'package:carparking/Auth/login/login_screen.dart';
import 'package:carparking/Home/Employee/provider/employee_provider.dart';
import 'package:carparking/Home/HomeScreen/provider/holiday_provider.dart';
import 'package:carparking/Home/Profile/Screen/profile_screen.dart';
import 'package:carparking/Home/Task/assign_task_screen.dart';
import 'package:carparking/Home/Task/model/task_model.dart';
import 'package:carparking/Home/Task/task_screen.dart';
import 'package:carparking/Home/Employee/screen/add_employee_screen.dart';
import 'package:carparking/LeaveRequest/screen/leave_screen.dart';

import 'package:carparking/util/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/provider/auth_provider.dart';
import '../../LeaveRequest/widget/my_leave_screen.dart';
import '../Employee/screen/employee_details_screen.dart';
import '../Employee/model/employee_model.dart';
import '../Employee/screen/employee_screen.dart';
import '../Secret Locker/screen/secret_locker_screen.dart';
import '../Task/manage_task.dart';
import '../Task/provider/task_provider.dart';
import 'model/holiday_model.dart';

String punchin = '';
String punchout = '';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  // var time;

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    SharedPreferences pref = await SharedPreferences.getInstance();
    authProvider.role = pref.getString('role') ?? '';
    setState(() {});


    setState(() {
      isLoading = false;
    });
  }

  logout() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Log Out'),
            content: Text('Are you sure want to logout?'),
            actions: [
              InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
                },
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor,
                        blurRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 14,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: true);
    final empProvider = Provider.of<EmployeeProvider>(context, listen: true);
    final holiDayProvider = Provider.of<HolyDayProvider>(context, listen: true);
    final taskProvider = Provider.of<TaskProvider>(context, listen: true);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 170,
              width: double.infinity,
              color: primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (authProvider.doc != null) ...[
                    CircleAvatar(
                      radius: 38,
                      backgroundImage: NetworkImage(
                          authProvider.doc!.docs[0].data()['employeeImage']),
                    ),
                    Text(authProvider.doc!.docs[0].data()['employeeFirstName'],
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    Text(authProvider.doc!.docs[0].data()['employeeId'],
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 14,
                        )),
                  ]
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: blackColor,
              ),
              title: Text(
                "Profile",
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w600),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SecretLockerScreen()));
              },
              leading: Icon(
                Icons.lock,
                color: blackColor,
              ),
              title: Text(
                "Secret Locker",
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w600),
              ),
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.airplanemode_active,
            //     color: blackColor,
            //   ),
            //   title: Text(
            //     "Business Trip",
            //     style:
            //         TextStyle(color: blackColor, fontWeight: FontWeight.w600),
            //   ),
            // ),
            ListTile(
              leading: Icon(
                CupertinoIcons.star_lefthalf_fill,
                color: blackColor,
              ),
              title: Text(
                "Rate",
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w600),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                logout();
              },
              leading: Icon(
                Icons.logout,
                color: blackColor,
              ),
              title: Text(
                "Log Out",
                style:
                    TextStyle(color: blackColor, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'StaffSync',
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
        ],
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: (isLoading == true)
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    (authProvider.role == 'emp')
                        ? Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: secondaryColor.withOpacity(0.3)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(authProvider
                                          .doc!.docs[0]
                                          .data()['employeeImage']),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          authProvider.doc!.docs[0]
                                              .data()['employeeFirstName'],
                                          style: TextStyle(
                                              color: blackColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          authProvider.doc!.docs[0]
                                              .data()['employeeId'],
                                          style: TextStyle(
                                            color: blackColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyLeaveScreen(
                                                      index: 0,
                                                    )));
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: primaryColor,
                                              blurRadius: 1,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Apply Leave',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LeaveScreen()));
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'My Leave',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: secondaryColor.withOpacity(0.3)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        authProvider.doc!.docs[0]
                                            .data()['employeeImage'],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text(
                                            authProvider.doc!.docs[0]
                                                .data()['employeeFirstName'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: blackColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Text(
                                          'Human Resource',
                                          style: TextStyle(
                                            color: blackColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TaskScreen()));
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: primaryColor,
                                              blurRadius: 1,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Manage Task',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AssignTaskScreen()));
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Assign Task',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    (authProvider.role == 'emp')
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Upcoming Task',
                                    style: TextStyle(
                                        color: blackColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TaskScreen()));
                                    },
                                    child: Text(
                                      'View All',
                                      style: TextStyle(
                                          color: blackColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 120,
                                  width: double.infinity,
                                  child: FutureBuilder(
                                      future: taskProvider.getEmployeeTask(
                                          authProvider.doc!.docs[0]
                                              .data()['team']),
                                      builder: (context,
                                          AsyncSnapshot<List<TaskModel>>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else {
                                          if (snapshot.data!.isNotEmpty) {
                                            return ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    snapshot.data!.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        ManageTaskScreen(
                                                                          taskId: snapshot
                                                                              .data![index]
                                                                              .taskId!,
                                                                          taskName: snapshot
                                                                              .data![index]
                                                                              .taskName!,
                                                                          taskCode: snapshot
                                                                              .data![index]
                                                                              .taskCode!,
                                                                          assignTo: snapshot
                                                                              .data![index]
                                                                              .assignTo!,
                                                                          managerName: snapshot
                                                                              .data![index]
                                                                              .managerName!,
                                                                          currentStatus: snapshot
                                                                              .data![index]
                                                                              .currentStatus!,
                                                                          assignDate: snapshot
                                                                              .data![index]
                                                                              .assignDate!,
                                                                          endDate: snapshot
                                                                              .data![index]
                                                                              .endDate!,
                                                                          timeTaken: snapshot
                                                                              .data![index]
                                                                              .timeTaken!,
                                                                          index:
                                                                              index,
                                                                        )));
                                                      },
                                                      child: Container(
                                                        // height: 130,
                                                        width: 270,
                                                        decoration: BoxDecoration(
                                                            color: whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: secondaryColor
                                                                      .withOpacity(
                                                                          0.2),
                                                                  spreadRadius:
                                                                      0.2,
                                                                  blurRadius: 9)
                                                            ]),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .taskCode!,
                                                                    style: TextStyle(
                                                                        color:
                                                                            blackColor,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .taskName!,
                                                                    style: TextStyle(
                                                                        // color: grayColor,
                                                                        fontSize: 15,
                                                                        fontWeight: FontWeight.w500),
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .managerName!,
                                                                    style: TextStyle(
                                                                        // color: grayColor,
                                                                        fontSize: 12,
                                                                        fontWeight: FontWeight.w500),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                        color:
                                                                            errorColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          Text(
                                                                        snapshot
                                                                            .data![index]
                                                                            .currentStatus!,
                                                                        style: TextStyle(
                                                                            color:
                                                                                whiteColor,
                                                                            fontSize:
                                                                                12),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    'Due by - ${snapshot.data![index].endDate!}',
                                                                    style: TextStyle(
                                                                        color:
                                                                            grayColor,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w500),
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
                                              child: Text(
                                                'No Task Available',
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            );
                                          }
                                        }
                                      })),
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Employee Details',
                                    style: TextStyle(
                                        color: blackColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EmployeeScreen(
                                                    index: 0,
                                                  )));
                                    },
                                    child: Text(
                                      'View All',
                                      style: TextStyle(
                                          color: blackColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 150,
                                width: double.infinity,
                                child: FutureBuilder(
                                    future: empProvider.getEmployees(),
                                    builder: (context,
                                        AsyncSnapshot<List<EmployeeModel>>
                                            snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      } else {
                                        print(snapshot.data);
                                        if (snapshot.data!.isNotEmpty) {
                                          return ListView.builder(
                                              itemCount:
                                                  snapshot.data!.length >= 3
                                                      ? 3
                                                      : snapshot.data!.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(MaterialPageRoute(
                                                          builder: (context) => EmployeeDetailsScreen(
                                                              city: snapshot
                                                                  .data![index]
                                                                  .city!,
                                                              country: snapshot
                                                                  .data![index]
                                                                  .country!,
                                                              gender: snapshot
                                                                  .data![index]
                                                                  .gender!,
                                                              status: snapshot
                                                                  .data![index]
                                                                  .status!,
                                                              dob: snapshot
                                                                  .data![index]
                                                                  .dob!,
                                                              state: snapshot
                                                                  .data![index]
                                                                  .state!,
                                                              mobile: snapshot
                                                                  .data![index]
                                                                  .mobile!,
                                                              home: snapshot
                                                                  .data![index]
                                                                  .home!,
                                                              address: snapshot
                                                                  .data![index]
                                                                  .address!,
                                                              issueDate: snapshot
                                                                  .data![index]
                                                                  .issueDate!,
                                                              docId: snapshot
                                                                  .data![index]
                                                                  .docId!,
                                                              employeeFirstName: snapshot
                                                                  .data![index]
                                                                  .employeeFirstName!,
                                                              employeeImage: snapshot
                                                                  .data![index]
                                                                  .employeeImage!,
                                                              employeeLastName: snapshot
                                                                  .data![index]
                                                                  .employeeLastName!,
                                                              employeeId: snapshot
                                                                  .data![index]
                                                                  .employeeId!,
                                                              employeeDept: snapshot.data![index].employeeDept!,
                                                              employeePunchIn: snapshot.data![index].employeePunchIn!,
                                                              team: snapshot.data![index].team!,
                                                              password: snapshot.data![index].password!,
                                                              employeeEmail: snapshot.data![index].employeeEmail!,
                                                              employeePosition: snapshot.data![index].employeePosition!)));
                                                    },
                                                    child: Container(
                                                      height: 130,
                                                      width: 250,
                                                      decoration: BoxDecoration(
                                                          color: whiteColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: secondaryColor
                                                                    .withOpacity(
                                                                        0.2),
                                                                spreadRadius:
                                                                    0.2,
                                                                blurRadius: 9)
                                                          ]),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 45,
                                                              backgroundImage:
                                                                  NetworkImage(snapshot
                                                                      .data![
                                                                          index]
                                                                      .employeeImage!),
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .employeeFirstName!,
                                                                  style: TextStyle(
                                                                      color:
                                                                          blackColor,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .employeePosition!,
                                                                  style: TextStyle(
                                                                      color:
                                                                          grayColor,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .employeeDept!,
                                                                  style: TextStyle(
                                                                      color:
                                                                          grayColor,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Text(
                                                                  'Punch In - ${snapshot.data![index].employeePunchIn!} AM',
                                                                  style: TextStyle(
                                                                      color:
                                                                          grayColor,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        } else {
                                          return Center(
                                            child: Text(
                                              'No Employees Available',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          );
                                        }
                                      }
                                    }),
                              ),
                            ],
                          ),
                    (authProvider.role == 'emp')
                        ? Container()
                        : Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 40.0, right: 40),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddEmployeeScreen()));
                                  },
                                  child: Container(
                                    height: 55,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text(
                                        '+  Add New Employee',
                                        style: TextStyle(
                                            color: whiteColor, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Upcoming Holidays',
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 150,
                      width: double.infinity,
                      child: FutureBuilder(
                          future: holiDayProvider.getHoliDayList(),
                          builder: (context,
                              AsyncSnapshot<List<HolidayModel>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              if (snapshot.data!.isNotEmpty) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 130,
                                          width: 270,
                                          decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data![index]
                                                      .holidayImage!),
                                                  fit: BoxFit.fitWidth),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: secondaryColor
                                                        .withOpacity(0.2),
                                                    spreadRadius: 0.2,
                                                    blurRadius: 9)
                                              ]),
                                        ),
                                      );
                                    });
                              } else {
                                return Center(
                                  child: Text(
                                    'No Upcoming Holidays',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                );
                              }
                            }
                          }),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
