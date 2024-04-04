import 'package:carparking/Home/Profile/Screen/payrooll_info_screen.dart';
import 'package:carparking/Home/Profile/Screen/personal_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../PayRoll/widget/my_payroll_screen.dart';
import '../../../util/color.dart';
import '../../Employee/screen/employee_screen.dart';
import 'job_info_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
          ),
          iconTheme: IconThemeData(color: whiteColor),
          backgroundColor: primaryColor,
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: whiteColor,
            unselectedLabelColor: whiteColor,
            labelColor: whiteColor,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            tabs: [
              Tab(text: 'Job Info'),
              Tab(text: 'Personal Info'),
              Tab(text: 'Payroll Info'),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            JobInfoScreen(),
            PersonalInfoScreen(),
            PayrollInfoScreen(),
          ],
        ),
      ),
    );
  }
}
