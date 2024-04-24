import 'package:carparking/Auth/provider/auth_provider.dart';
import 'package:carparking/LeaveRequest/provider/leave_provider.dart';
import 'package:carparking/util/toast_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../util/color.dart';

class MyLeaveScreen extends StatefulWidget {
  final int index;

  const MyLeaveScreen({super.key, required this.index});

  @override
  State<MyLeaveScreen> createState() => _MyLeaveScreenState();
}

class _MyLeaveScreenState extends State<MyLeaveScreen> {
  TextEditingController employeeIdController = TextEditingController();
  TextEditingController employeePositionController = TextEditingController();
  TextEditingController requestDateController = TextEditingController();
  TextEditingController leaveTypeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController totalDaysController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController availableLeaveController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  bool isLoading = false;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    // TODO: implement initState
    employeeIdController.text = authProvider.doc!.docs.isNotEmpty
        ? authProvider.doc!.docs[0]['employeeId']
        : authProvider.user!.uid;
    super.initState();
  }

  sendLeave() async {
    final authProvider =
    Provider.of<AuthenticationProvider>(context, listen: false);
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: false);
    try {
      await leaveProvider.applyLeave(
          employeeIdController.text,
          employeePositionController.text,
          requestDateController.text,
          leaveTypeController.text,
          reasonController.text,
          fromDateController.text,
          toDateController.text,
          totalDaysController.text,
        authProvider.doc!.docs[0]['employeeFirstName'],);
      ToastMessage().showSuccessMessage('Leave Applied');
      Navigator.of(context).pop();
    } catch (e) {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: true);
    return Scaffold(
      appBar: (widget.index == 0)
          ? AppBar(
              title: Text(
                authProvider.doc!.docs[0]['employeeFirstName'],
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Employee Id',
                  style: TextStyle(
                    color: grayColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter id';
                    }
                  },
                  controller: employeeIdController,
                  decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: grayColor.withOpacity(0.2),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Position',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter position';
                    }
                  },
                  controller: employeePositionController,
                  decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: grayColor.withOpacity(0.2),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Request Date',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter request date';
                    }
                  },
                  controller: requestDateController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now());

                        if (date != null) {
                          setState(() {
                            String formatedDate =
                                DateFormat('dd-MM-yyyy').format(date);
                            requestDateController.text = formatedDate;
                            // var timeDate = endDate!.difference(startDate!).inDays;
                            // timeTakenController.text = '$timeDate Days';
                          });
                        }
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: grayColor.withOpacity(0.2),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Leave Type',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter leave type';
                    }
                  },
                  controller: leaveTypeController,
                  decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: grayColor.withOpacity(0.2),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Reason',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter reason';
                    }
                  },
                  controller: reasonController,
                  decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: grayColor.withOpacity(0.2),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Text(
                  'From Date',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter from date';
                    }
                  },
                  controller: fromDateController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        startDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050));

                        if (startDate != null) {
                          setState(() {
                            String formatedDate =
                                DateFormat('dd-MM-yyyy').format(startDate!);
                            fromDateController.text = formatedDate;
                            if (endDate != null) {
                              var timeDate =
                                  endDate!.difference(startDate!).inDays;
                              totalDaysController.text = '$timeDate Days';
                            }
                          });
                        }
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: grayColor.withOpacity(0.2),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'To Date',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter to date';
                    }
                  },
                  controller: toDateController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        endDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050));

                        if (endDate != null) {
                          setState(() {
                            String formatedDate =
                                DateFormat('dd-MM-yyyy').format(endDate!);
                            toDateController.text = formatedDate;
                            var timeDate =
                                endDate!.difference(startDate!).inDays;
                            totalDaysController.text = '$timeDate Days';
                          });
                        }
                      },
                      icon: Icon(Icons.calendar_month),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: grayColor.withOpacity(0.2),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Total Days',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  readOnly: true,
                  style: TextStyle(fontSize: 14),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter total days';
                    }
                  },
                  controller: totalDaysController,
                  decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: errorColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: grayColor.withOpacity(0.2),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   'Available Leave',
                //   style:
                //       TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                // ),
                // SizedBox(
                //   height: 5,
                // ),
                // TextFormField(
                //   controller: availableLeaveController,
                //   decoration: InputDecoration(
                //     focusedErrorBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //       borderSide: BorderSide(
                //         color: errorColor,
                //         width: 2.0,
                //       ),
                //     ),
                //     errorBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //       borderSide: BorderSide(
                //         color: errorColor,
                //         width: 2.0,
                //       ),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //       borderSide: BorderSide(
                //         color: grayColor.withOpacity(0.2),
                //         width: 2.0,
                //       ),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //       borderSide: BorderSide(
                //         color: primaryColor,
                //       ),
                //     ),
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                //   ),
                // ),

                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: (isLoading == true)
                      ? Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: whiteColor,
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              sendLeave().then((value) {
                                setState(() {
                                  isLoading = false;
                                });
                              });
                            }
                          },
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Send',
                                style:
                                    TextStyle(color: whiteColor, fontSize: 16),
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
    );
  }
}
