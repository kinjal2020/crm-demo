import 'package:carparking/Home/Employee/employee_screen.dart';
import 'package:flutter/material.dart';

import '../../util/color.dart';
import '../widget/my_leave_screen.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({super.key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Leave Request',
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
          ),
          iconTheme: IconThemeData(color: whiteColor),
          backgroundColor: primaryColor,
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: whiteColor,
            unselectedLabelColor: whiteColor,
            labelColor: whiteColor,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            tabs: [
              Tab(text: 'My Leave'),
              Tab(text: 'Employee Leave'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyLeaveScreen(
              index: 1,
            ),
            EmployeeScreen(index: 2),
          ],
        ),
      ),
    );
  }
}
