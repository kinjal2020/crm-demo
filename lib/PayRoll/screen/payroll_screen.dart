import 'package:carparking/Home/Employee/screen/employee_screen.dart';
import 'package:carparking/PayRoll/widget/my_payroll_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/color.dart';

class PayRollScreen extends StatefulWidget {
  const PayRollScreen({super.key});

  @override
  State<PayRollScreen> createState() => _PayRollScreenState();
}

class _PayRollScreenState extends State<PayRollScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'PayRoll',
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
              Tab(text: 'My PayRoll'),
              Tab(text: 'Employee PayRoll'),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            MyPayRollScreen(index: 0,),
            EmployeeScreen(index: 1),
          ],
        ),
      ),
    );
  }
}
