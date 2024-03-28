import 'package:carparking/Home/Employee/model/employee_model.dart';
import 'package:carparking/PayRoll/model/payroll_model.dart';
import 'package:carparking/PayRoll/screen/payroll_details_screen.dart';
import 'package:carparking/util/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPayRollScreen extends StatefulWidget {
  final int index;
  List<PayRollModel>? payrollList;
  String? empName;

  MyPayRollScreen(
      {super.key, required this.index, this.payrollList, this.empName});

  @override
  State<MyPayRollScreen> createState() => _MyPayRollScreenState();
}

class _MyPayRollScreenState extends State<MyPayRollScreen> {
  List<PayRollModel> payrollList = [];

  @override
  void initState() {
    // TODO: implement initState
    payrollList = (widget.payrollList ?? employeeList.first.payrollList)!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.index == 1)
          ? AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(CupertinoIcons.back)),
              title: Text(
                (widget.empName != null)
                    ? widget.empName!
                    : 'List of Employees',
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
      body: ListView.builder(
          itemCount: payrollList.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: grayColor.withOpacity(0.2))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Salary Summary',
                            style: TextStyle(
                                fontSize: 18,
                                color: blackColor.withOpacity(0.8)),
                          ),
                          Text(
                            payrollList[index].month!,
                            style: TextStyle(
                                fontSize: 15,
                                color: blackColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Earning',
                            style: TextStyle(
                                fontSize: 18,
                                color: blackColor.withOpacity(0.8)),
                          ),
                          SizedBox(
                            width: 95,
                          ),
                          Text(
                            'Rs.${payrollList[index].totalEarning!}',
                            style: TextStyle(
                                fontSize: 18,
                                color: blackColor.withOpacity(0.8)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Deduction',
                            style: TextStyle(
                                fontSize: 18,
                                color: blackColor.withOpacity(0.8)),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Text(
                            'Rs.${payrollList[index].totalDeduction!}',
                            style: TextStyle(
                                fontSize: 18,
                                color: blackColor.withOpacity(0.8)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PayRollDetailScreen(
                                  id: payrollList[index].id!,
                                  jobStatus: payrollList[index].jobStatus!,
                                  month: payrollList[index].month!,
                                  totalWorkDays:
                                      payrollList[index].totalWorkDays!,
                                  workedDays: payrollList[index].workedDays!,
                                  additionalDays:
                                      payrollList[index].additionalDays!,
                                  totalEarning:
                                      payrollList[index].totalEarning!,
                                  basicPayroll:
                                      payrollList[index].basicPayroll!,
                                  dA: payrollList[index].dA!,
                                  otherPay: payrollList[index].otherPay!,
                                  totalDeduction:
                                      payrollList[index].totalDeduction!,
                                  pf: payrollList[index].pf!,
                                  esi: payrollList[index].esi!)));
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            'View All',
                            style: TextStyle(color: primaryColor, fontSize: 18),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
