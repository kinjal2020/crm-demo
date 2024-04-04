import 'dart:io';
import 'dart:math';

import 'package:carparking/Home/Employee/provider/employee_provider.dart';
import 'package:carparking/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../util/color.dart';
import '../../../util/toast_message.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  final String employeeFirstName;
  final String employeeImage;
  final String employeeLastName;
  final String employeeId;
  final String employeeDept;
  final String employeePunchIn;
  final String team;
  final String password;
  final String employeeEmail;
  final String employeePosition;

  const EmployeeDetailsScreen(
      {super.key,
      required this.employeeFirstName,
      required this.employeeImage,
      required this.employeeLastName,
      required this.employeeId,
      required this.employeeDept,
      required this.employeePunchIn,
      required this.team,
      required this.password,
      required this.employeeEmail,
      required this.employeePosition});

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

enum Gender { Male, Female }

enum MaritalStatus { Yes, No }

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  Gender gender = Gender.Male;
  MaritalStatus status = MaritalStatus.Yes;
  bool isLoading = false;
  bool isDeleteLoading = false;

  Future deleteEmp() async {
    final taskProvider = Provider.of<EmployeeProvider>(context, listen: false);
    try {
      await taskProvider.deleteEmployee(
        widget.employeeId,
      );
      ToastMessage().showSuccessMessage('Employee Deleted.');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyHomePage()),
          (route) => false);
    } catch (e) {
      print(e);
      ToastMessage().showErrorMessage('Something went wrong.');
    }
  }

  @override
  Widget build(BuildContext context) {
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
          widget.employeeFirstName,
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
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: FileImage(File(widget.employeeImage)),
                      backgroundColor: grayColor,
                    ),
                    Positioned(
                        top: 100,
                        left: 110,
                        child:
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
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
                        widget.employeeId,
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
                      Container(child: Text(widget.employeePosition)),
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
                      Container(child: Text(widget.employeeDept)),
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
                            "Dob",
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
                      Container(child: Text("")),
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
                            "Country",
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
                      Container(child: Text("India")),
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
                            "State",
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
                      Container(child: Text(" ")),
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
                            "City",
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
                      Container(child: Text(" ")),
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
                            "Mobile Number",
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
                      Container(child: Text("")),
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
                            "Home Number",
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
                      Container(child: Text("")),
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
                            "Mail Id",
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
                      Container(child: Text(widget.employeeEmail)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 132,
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
                      children: [
                        Container(
                            width: 150,
                            child: Text(
                              "Gender",
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              // color: Colors.red,
                              child: RadioListTile(
                                visualDensity: VisualDensity.compact,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.1),
                                title: Text(
                                  'Male',
                                  style: TextStyle(fontSize: 16),
                                ),
                                value: Gender.Male,
                                groupValue: gender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 110,
                              // color: Colors.red,
                              child: RadioListTile(
                                visualDensity: VisualDensity.compact,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.1),
                                title: Text(
                                  'Female',
                                  style: TextStyle(fontSize: 16),
                                ),
                                value: Gender.Female,
                                groupValue: gender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 132,
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
                      children: [
                        Container(
                            width: 150,
                            child: Text(
                              "Marital Status",
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              // color: Colors.red,
                              child: RadioListTile(
                                visualDensity: VisualDensity.compact,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.1),
                                title: Text(
                                  'Yes',
                                  style: TextStyle(fontSize: 16),
                                ),
                                value: MaritalStatus.Yes,
                                groupValue: status,
                                onChanged: (MaritalStatus? value) {
                                  setState(() {
                                    status = value!;
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 110,
                              // color: Colors.red,
                              child: RadioListTile(
                                visualDensity: VisualDensity.compact,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.1),
                                title: Text(
                                  'No',
                                  style: TextStyle(fontSize: 16),
                                ),
                                value: MaritalStatus.No,
                                groupValue: status,
                                onChanged: (MaritalStatus? value) {
                                  setState(() {
                                    status = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                // height: 40,
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
                            "Addresss",
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
                        width: 150,
                        child: Text(
                          "",
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
                // height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: grayColor.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Password Information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // height: 40,
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
                            "Password",
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
                        width: 150,
                        child: Text(
                          "*******",
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
                // height: 40,
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
                            "Issue Date",
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
                        width: 150,
                        child: Text(
                          "31/03/2006",
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /*  (isLoading == true)
                        ? Container(
                      height: 55,
                      width:
                      MediaQuery.of(context).size.width / 2 - 100,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                        :*/
                    InkWell(
                      onTap: () {
                        // if (formKey.currentState!.validate()) {
                        //   setState(() {
                        //     isLoading = true;
                        //   });
                        //   updateTask().then((value) {
                        //     setState(() {
                        //       isLoading = false;
                        //     });
                        //   });
                        // }
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 2 - 100,
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
                     (isDeleteLoading == true)
                        ? Container(
                      height: 55,
                      width:
                      MediaQuery.of(context).size.width / 2 - 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: CircularProgressIndicator(color: primaryColor,),
                      ),
                    )
                        :
                    InkWell(
                      onTap: () {
                        setState(() {
                          isDeleteLoading = true;
                        });
                        deleteEmp().then((value) {
                          setState(() {
                            isDeleteLoading = false;
                          });
                        });
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 2 - 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Delete',
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
