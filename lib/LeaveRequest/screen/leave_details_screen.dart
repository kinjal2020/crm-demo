import 'package:carparking/LeaveRequest/model/leave_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Auth/provider/auth_provider.dart';
import '../../util/color.dart';
import '../../util/toast_message.dart';
import '../provider/leave_provider.dart';

class LeaveDetailsScreen extends StatefulWidget {
  final LeaveModel leaveModel;

  const LeaveDetailsScreen({super.key, required this.leaveModel});

  @override
  State<LeaveDetailsScreen> createState() => _LeaveDetailsScreenState();
}

class _LeaveDetailsScreenState extends State<LeaveDetailsScreen> {

  bool isApproveLoading = false;
  bool isRejectLoading = false;

  getData() async {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    authProvider.role = pref.getString('role') ?? '';
    setState(() {});

  }

  approveLeave() async {
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: false);
    try {
      await leaveProvider.approveLeave(widget.leaveModel.leaveId!);
      ToastMessage().showSuccessMessage('Leave Approved');
      Navigator.of(context).pop();
    } catch (e) {
      // TODO
    }
  }

  rejectLeave() async {
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: false);
    try {
      await leaveProvider.rejectLeave(widget.leaveModel.leaveId!);
      ToastMessage().showSuccessMessage('Leave Rejected');
      Navigator.of(context).pop();
    } catch (e) {
      // TODO
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
    Provider.of<AuthenticationProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(CupertinoIcons.back)),
        title: Text(
          'Leave',
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
        ),
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: grayColor.withOpacity(0.2),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 150,
                          child: Text(
                            "Employee Id",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        width: 20,
                        height: 20,
                        child: Text(
                          ":",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(
                          child: Text(
                        widget.leaveModel.empId!,
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: grayColor.withOpacity(0.2),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 150,
                          child: Text(
                            "Position",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        width: 20,
                        height: 20,
                        child: Text(
                          ":",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(child: Text(widget.leaveModel.position!)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: grayColor.withOpacity(0.2),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 150,
                          child: Text(
                            "Request Date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        width: 20,
                        height: 20,
                        child: Text(
                          ":",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(child: Text(widget.leaveModel.requestDate!)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: grayColor.withOpacity(0.2),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 150,
                          child: Text(
                            "Leave Type",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        width: 20,
                        height: 20,
                        child: Text(
                          ":",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(child: Text(widget.leaveModel.leaveType!)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: grayColor.withOpacity(0.2),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 150,
                          child: Text(
                            "Reason",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        width: 20,
                        height: 20,
                        child: Text(
                          ":",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(child: Text(widget.leaveModel.reason!)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: grayColor.withOpacity(0.2),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 150,
                          child: Text(
                            "Total Days",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        width: 20,
                        height: 20,
                        child: Text(
                          ":",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(child: Text(widget.leaveModel.totalDays!)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: grayColor.withOpacity(0.2),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 150,
                          child: Text(
                            "From Date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        width: 20,
                        height: 20,
                        child: Text(
                          ":",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(child: Text(widget.leaveModel.fromDate!)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: grayColor.withOpacity(0.2),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 150,
                          child: Text(
                            "To Date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )),
                      Container(
                        width: 20,
                        height: 20,
                        child: Text(
                          ":",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(child: Text(widget.leaveModel.toDate!)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Container(
              //   height: 40,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10.0),
              //     border: Border.all(
              //       color: grayColor.withOpacity(0.2),
              //       width: 2.0,
              //     ),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Row(
              //       //  mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Container(
              //             width: 150,
              //             child: Text(
              //               "Available Leave",
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 16),
              //             )),
              //         Container(
              //           width: 20,
              //           height: 20,
              //           child: Text(
              //             ":",
              //             style: TextStyle(fontWeight: FontWeight.w900),
              //           ),
              //         ),
              //         Container(child: Text("9857463789")),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),

              (authProvider.role == 'hr')
                  ? (widget.leaveModel.status != 'Pending')
                      ? Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              widget.leaveModel.status!,
                              style: TextStyle(color: whiteColor, fontSize: 16),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              (isApproveLoading == true)
                                  ? Container(
                                      height: 55,
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          100,
                                      decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          isApproveLoading = true;
                                        });
                                        approveLeave().then((value) {
                                          setState(() {
                                            isApproveLoading = false;
                                          });
                                        });
                                      },
                                      child: Container(
                                        height: 55,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                100,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            'Approve',
                                            style: TextStyle(
                                                color: whiteColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                              (isRejectLoading == true)
                                  ? Container(
                                      height: 55,
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: primaryColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: primaryColor,
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          isRejectLoading = true;
                                        });
                                        rejectLeave().then((value) {
                                          setState(() {
                                            isRejectLoading = false;
                                          });
                                        });
                                      },
                                      child: Container(
                                        height: 55,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: primaryColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            'Reject',
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        )
                  : Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          widget.leaveModel.status!,
                          style: TextStyle(color: whiteColor, fontSize: 16),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
