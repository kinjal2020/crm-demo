import 'dart:async';

import 'package:carparking/Home/Task/assign_task_screen.dart';
import 'package:carparking/Home/Task/model/task_model.dart';
import 'package:carparking/Home/Task/task_screen.dart';
import 'package:carparking/Home/Employee/screen/add_employee_screen.dart';

import 'package:carparking/util/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/provider/auth_provider.dart';
import '../../LeaveRequest/widget/my_leave_screen.dart';
import '../Employee/screen/employee_details_screen.dart';
import '../Employee/model/employee_model.dart';
import '../Employee/screen/employee_screen.dart';
import 'model/holiday_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          'Hello Connect',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (role == 'emp')
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                    'https://img.freepik.com/premium-photo/business-woman-entrepreneur-working-office-professional-employee-workplace-young-beautiful-secretary-girl_265223-28262.jpg'),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Ashawanath',
                                    style: TextStyle(
                                        color: blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Employee101',
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MyLeaveScreen(
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
                                    borderRadius: BorderRadius.circular(8),
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          AssignTaskScreen()));
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
                                      'Edit Leave',
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                    'https://img.freepik.com/premium-photo/business-woman-entrepreneur-working-office-professional-employee-workplace-young-beautiful-secretary-girl_265223-28262.jpg'),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100,
                                    child: Text(
                                      authProvider.user!.email!,
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => TaskScreen()));
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          AssignTaskScreen()));
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
              (role == 'emp')
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TaskScreen()));
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
                          child: ListView.builder(
                              itemCount:
                                  taskList.length >= 3 ? 3 : taskList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // height: 130,
                                    width: 270,
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color: secondaryColor
                                                  .withOpacity(0.2),
                                              spreadRadius: 0.2,
                                              blurRadius: 9)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                taskList[index].taskCode!,
                                                style: TextStyle(
                                                    color: blackColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                taskList[index].taskName!,
                                                style: TextStyle(
                                                    // color: grayColor,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                taskList[index].managerName!,
                                                style: TextStyle(
                                                    // color: grayColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: errorColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    taskList[index]
                                                        .currentStatus!,
                                                    style: TextStyle(
                                                        color: whiteColor,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Due by - ${taskList[index].endDate!}',
                                                style: TextStyle(
                                                    color: grayColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EmployeeScreen(
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
                          child: FutureBuilder(builder: (context,
                              AsyncSnapshot<List<EmployeeModel>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              if (snapshot.data!.isNotEmpty) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.length >= 3
                                        ? 3
                                        : employeeList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EmployeeDetailsScreen()));
                                          },
                                          child: Container(
                                            height: 130,
                                            width: 270,
                                            decoration: BoxDecoration(
                                                color: whiteColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: secondaryColor
                                                          .withOpacity(0.2),
                                                      spreadRadius: 0.2,
                                                      blurRadius: 9)
                                                ]),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 35,
                                                    backgroundImage:
                                                        NetworkImage(snapshot
                                                            .data![index]
                                                            .employeePhoto!),
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
                                                        snapshot.data![index]
                                                            .employeeFirstName!,
                                                        style: TextStyle(
                                                            color: blackColor,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        snapshot.data![index]
                                                            .employeeId!,
                                                        style: TextStyle(
                                                            color: grayColor,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                        snapshot.data![index]
                                                            .employeeDept!,
                                                        style: TextStyle(
                                                            color: grayColor,
                                                            fontSize: 12,
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
                                                            color: grayColor,
                                                            fontSize: 12,
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
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                );
                              }
                            }
                          }),
                        ),
                      ],
                    ),
              (role == 'emp')
                  ? Container()
                  : Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddEmployeeScreen()));
                            },
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(30)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Attendance Details',
                    style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  (role == 'emp')
                      ? Text(
                          'View Details',
                          style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        )
                      : Text(
                          'View Employee',
                          style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: secondaryColor.withOpacity(0.3)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Punch in',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '__:__',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Punch Out',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '__:__',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 60,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.login_outlined,
                                color: whiteColor,
                              ),
                              Text(
                                'Punch in',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: whiteColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
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
                child: ListView.builder(
                    itemCount: holiDayList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 130,
                          width: 270,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      holiDayList[index].holidayImage!),
                                  fit: BoxFit.fitWidth),
                              boxShadow: [
                                BoxShadow(
                                    color: secondaryColor.withOpacity(0.2),
                                    spreadRadius: 0.2,
                                    blurRadius: 9)
                              ]),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
