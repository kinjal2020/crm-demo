import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../Auth/provider/auth_provider.dart';
import '../../../util/color.dart';

class JobInfoScreen extends StatefulWidget {
  const JobInfoScreen({super.key});

  @override
  State<JobInfoScreen> createState() => _JobInfoScreenState();
}

class _JobInfoScreenState extends State<JobInfoScreen> {
  TextEditingController requestDateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController teamController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  TextEditingController daController = TextEditingController();
  TextEditingController joiningDateController = TextEditingController();
  TextEditingController workLocationController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    final authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
    nameController.text=authProvider.doc!.docs[0].data()['employeeFirstName'];
    idController.text=authProvider.doc!.docs[0].data()['employeeId'];
    if(authProvider.role=='emp'){
      positionController.text=authProvider.doc!.docs[0].data()['jobPosition'];
      teamController.text=authProvider.doc!.docs[0].data()['team'];
      departmentController.text=authProvider.doc!.docs[0].data()['department'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
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
                          "Name",
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
                      height: 40,
                        width: width/2-20,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 9),
                        ),
                        style: TextStyle(fontSize: 16, color: blackColor),
                      ),
                    ),
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
                          "Id",
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
                      height: 40,
                      width: width/2-20,
                      child: TextFormField(
                        controller: idController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 9),
                        ),
                        style: TextStyle(fontSize: 16, color: blackColor),
                      ),
                    ),
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
                    Container(
                      height: 40,
                      width: 100,
                      child: TextFormField(
                        controller: positionController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 9),
                        ),
                        style: TextStyle(fontSize: 16, color: blackColor),
                      ),
                    ),
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
                          "Department",
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
                      height: 40,
                      width: 100,
                      child: TextFormField(
                        controller: departmentController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 9),
                        ),
                        style: TextStyle(fontSize: 16, color: blackColor),
                      ),
                    ),
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
                          "Team",
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
                      height: 40,
                      width: 100,
                      child: TextFormField(
                        controller: teamController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 9),
                        ),
                        style: TextStyle(fontSize: 16, color: blackColor),
                      ),
                    ),
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
                          "Blood Group",
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
                      height: 40,
                      width: 100,
                      child: TextFormField(
                        controller: bloodGroupController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 9),
                        ),
                        style: TextStyle(fontSize: 16, color: blackColor),
                      ),
                    ),
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
                          "Shift",
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
                      height: 40,
                      width: 100,
                      child: TextFormField(
                        controller: shiftController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 9),
                        ),
                        style: TextStyle(fontSize: 16, color: blackColor),
                      ),
                    ),
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
                          "DA",
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
                      height: 40,
                      width: 100,
                      child: TextFormField(
                        controller: daController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 9),
                        ),
                        style: TextStyle(fontSize: 16, color: blackColor),
                      ),
                    ),
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
                          "Joining Date",
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
                      height: 40,
                      width: 180,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050));

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
                        controller: requestDateController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 9),
                        ),
                        style: TextStyle(fontSize: 16, color: blackColor),
                      ),
                    ),
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
                          "Work Location",
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
                      height: 40,
                      width: 100,
                      child: TextFormField(
                        controller: workLocationController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 9),
                        ),
                        style: TextStyle(fontSize: 16, color: blackColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Edit',
                      style: TextStyle(color: whiteColor, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
