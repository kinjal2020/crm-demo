import 'package:carparking/Home/Employee/model/employee_model.dart';
import 'package:carparking/PayRoll/widget/my_payroll_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/color.dart';
import 'employee_details_screen.dart';

class EmployeeScreen extends StatefulWidget {
  final int index;

  const EmployeeScreen({super.key, required this.index});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  List<EmployeeModel> empList = [];

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
    if (widget.index == 2) {
      for (int i = 0; i < employeeList.length; i++) {
        if (employeeList[i].leaveList.isNotEmpty) {
          setState(() {
            empList.add(employeeList[i]);
          });
        }
      }
    } else {
      empList = employeeList;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          : ListView.separated(
              itemCount: empList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        empList[index].employeePhoto!,
                      ),
                    ),
                    title: Text(empList[index].employeeName!,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    subtitle: Text(empList[index].employeeId!,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    trailing: InkWell(
                      onTap: () {
                        if (widget.index == 0) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EmployeeDetailsScreen()));
                        } else if (widget.index == 1) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyPayRollScreen(
                                    index: 1,
                                    empName: empList[index].employeeName,
                                    payrollList: empList[index].payrollList,
                                  )));
                        }
                        if (widget.index == 2) {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => LeaveDetailsScreen(
                          //           leaveModel: empList[index].leaveList,
                          //         )));
                        }
                      },
                      child: Text(
                        'View Detail',
                        style: TextStyle(color: primaryColor, fontSize: 14),
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
            ),
    );
  }
}
