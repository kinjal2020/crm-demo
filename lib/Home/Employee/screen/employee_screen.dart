import 'package:carparking/Home/Employee/model/employee_model.dart';
import 'package:carparking/LeaveRequest/model/leave_model.dart';
import 'package:carparking/LeaveRequest/provider/leave_provider.dart';
import 'package:carparking/LeaveRequest/screen/leave_details_screen.dart';
import 'package:carparking/PayRoll/widget/my_payroll_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../util/color.dart';
import '../provider/employee_provider.dart';
import 'employee_details_screen.dart';

class EmployeeScreen extends StatefulWidget {
  final int index;

  const EmployeeScreen({super.key, required this.index});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  String role = '';

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    role = pref.getString('role') ?? '';
    setState(() {});
    print(role);
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final empProvider = Provider.of<EmployeeProvider>(context, listen: true);
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: true);
    return Scaffold(
      appBar: (widget.index == 0)
          ? AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(CupertinoIcons.back)),
              title: Text(
                'List of Employees',
                style:
                    TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
              ),
              iconTheme: IconThemeData(color: whiteColor),
              backgroundColor: primaryColor,
            )
          : PreferredSize(
              preferredSize: Size(0, 0),
              child: Container(),
            ),
      body: (role == 'emp')
          ? Center(
              child: Text('You are not authorized for this section.'),
            )
          : (widget.index == 0 || widget.index == 1)
              ? FutureBuilder(
                  future: empProvider.getEmployees(),
                  builder:
                      (context, AsyncSnapshot<List<EmployeeModel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.data!.isNotEmpty) {
                        return ListView.separated(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    snapshot.data![index].employeeImage!,
                                  ),
                                ),
                                title: Text(
                                    snapshot.data![index].employeeFirstName!,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    snapshot.data![index].employeeId!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                trailing: InkWell(
                                  onTap: () {
                                    if (widget.index == 0) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EmployeeDetailsScreen(
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
                                                    employeeDept: snapshot
                                                        .data![index]
                                                        .employeeDept!,
                                                    employeePunchIn: snapshot
                                                        .data![index]
                                                        .employeePunchIn!,
                                                    team: snapshot
                                                        .data![index].team!,
                                                    password: snapshot
                                                        .data![index].password!,
                                                    employeeEmail: snapshot
                                                        .data![index]
                                                        .employeeEmail!,
                                                    employeePosition: snapshot
                                                        .data![index]
                                                        .employeePosition!,
                                                    docId: snapshot
                                                        .data![index].docId!,
                                                    dob: snapshot
                                                        .data![index].dob!,
                                                    state: snapshot
                                                        .data![index].state!,
                                                    mobile: snapshot
                                                        .data![index].mobile!,
                                                    home: snapshot
                                                        .data![index].home!,
                                                    address: snapshot
                                                        .data![index].address!,
                                                    issueDate: snapshot
                                                        .data![index]
                                                        .issueDate!,
                                                    city: snapshot
                                                        .data![index].city!,
                                                    country: snapshot
                                                        .data![index].country!,
                                                    gender: snapshot
                                                        .data![index].gender!,
                                                    status: snapshot
                                                        .data![index].status!,
                                                  )));
                                    } else if (widget.index == 1) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyPayRollScreen(
                                                    index: 1,
                                                    empName: snapshot
                                                        .data![index]
                                                        .employeeFirstName,
                                                    payrollList: [],
                                                  )));
                                    }
                                  },
                                  child: Text(
                                    'View Detail',
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 14),
                                  ),
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
                  })
              : FutureBuilder(
                  future: leaveProvider.getLeave(),
                  builder: (context, AsyncSnapshot<List<LeaveModel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.data!.isNotEmpty) {
                        return ListView.separated(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(snapshot.data![index].empName!,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(snapshot.data![index].empId!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500)),
                                trailing: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color:
                                              snapshot.data![index].status! !=
                                                      'Approved'
                                                  ? errorColor
                                                  : successColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          snapshot.data![index].status!,
                                          style: TextStyle(color: whiteColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (widget.index == 2) {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LeaveDetailsScreen(
                                                        leaveModel: snapshot
                                                            .data![index],
                                                      )));
                                        }
                                      },
                                      child: Text(
                                        'View Detail',
                                        style: TextStyle(
                                            color: primaryColor, fontSize: 14),
                                      ),
                                    ),
                                  ],
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
}
