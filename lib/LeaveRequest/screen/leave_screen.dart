import 'package:carparking/LeaveRequest/model/leave_model.dart';
import 'package:carparking/LeaveRequest/provider/leave_provider.dart';
import 'package:carparking/LeaveRequest/screen/leave_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Auth/provider/auth_provider.dart';
import '../../util/color.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: true);
    final leaveProvider = Provider.of<LeaveProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Leaves',
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
        ),
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: leaveProvider.getEmployeeLeave(
                authProvider.doc!.docs[0].data()['employeeId']),
            builder: (context, AsyncSnapshot<List<LeaveModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                print(snapshot.error);
                if (snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              // if (role == 'hr') {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LeaveDetailsScreen(
                                        leaveModel: snapshot.data![index],
                                      )));

                              // }
                            },
                            child: Container(
                              // height: 130,
                              width: 270,
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: secondaryColor.withOpacity(0.2),
                                        spreadRadius: 0.2,
                                        blurRadius: 9)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].requestDate!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          snapshot.data![index].reason!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                        ),
                                        Text(snapshot.data![index].totalDays!),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: snapshot.data![index]
                                                          .status! !=
                                                      'Approved'
                                                  ? errorColor
                                                  : successColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              snapshot.data![index].status!,
                                              style:
                                                  TextStyle(color: whiteColor),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${snapshot.data![index].fromDate!} to ${snapshot.data![index].toDate!}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: grayColor),
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
                      'No Leave available',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
              }
            }),
      ),
    );
  }
}
