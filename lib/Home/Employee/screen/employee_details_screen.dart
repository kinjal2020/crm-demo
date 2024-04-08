import 'dart:io';
import 'dart:math';

import 'package:carparking/Home/Employee/provider/employee_provider.dart';
import 'package:carparking/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
  final String docId;
  final String dob;
  final String state;
  final String country;
  final String city;
  final String mobile;
  final String home;
  final String address;
  final String issueDate;
  final String gender;
  final String status;

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
      required this.employeePosition,
      required this.docId,
      required this.dob,
      required this.state,
      required this.mobile,
      required this.home,
      required this.address,
      required this.issueDate,
      required this.country,
      required this.city,
      required this.gender,
      required this.status});

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
  bool isEditLoading = false;

  File? imageFile;
  TextEditingController employeeIdController = TextEditingController();
  TextEditingController employeeFirstNameController = TextEditingController();
  TextEditingController employeeLastNameController = TextEditingController();
  TextEditingController employeePasswordController = TextEditingController();
  TextEditingController employeeDOBController = TextEditingController();
  TextEditingController employeeEmailIdController = TextEditingController();
  TextEditingController employeeJobPositionController = TextEditingController();
  TextEditingController employeeDepartmentController = TextEditingController();
  TextEditingController employeeCountryController = TextEditingController();
  TextEditingController employeeStateController = TextEditingController();
  TextEditingController employeeCityController = TextEditingController();
  TextEditingController employeeMobileController = TextEditingController();
  TextEditingController employeeHomeNumberController = TextEditingController();
  TextEditingController employeeAddressController = TextEditingController();
  TextEditingController employeeIssueDateController = TextEditingController();

  Future deleteEmp() async {
    final empProvider = Provider.of<EmployeeProvider>(context, listen: false);
    try {
      await empProvider.deleteEmployee(
        widget.docId,
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

  Future updateEmp() async {
    final empProvider = Provider.of<EmployeeProvider>(context, listen: false);
    try {
      await empProvider.editEmployee(
          employeePasswordController.text,
          employeeEmailIdController.text,
          employeeJobPositionController.text,
          employeeDepartmentController.text,
          widget.team,
          employeeIdController.text,
          widget.docId,
          employeeDOBController.text,
          employeeCountryController.text,
          employeeStateController.text,
          employeeCityController.text,
          employeeMobileController.text,
          employeeHomeNumberController.text,
          gender.name,
          status.name,
          employeeAddressController.text,
          employeeIssueDateController.text);
      ToastMessage().showSuccessMessage('Employee updated.');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyHomePage()),
          (route) => false);
    } catch (e) {
      print(e);
      ToastMessage().showErrorMessage('Something went wrong.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    employeeIdController.text = widget.employeeId;
    employeeJobPositionController.text = widget.employeePosition;
    employeeDepartmentController.text = widget.employeeDept;
    employeeEmailIdController.text = widget.employeeEmail;
    employeePasswordController.text = widget.password;
    employeeDOBController.text = widget.dob;
    employeeCountryController.text = widget.country;
    employeeCityController.text = widget.city;
    employeeStateController.text = widget.state;
    employeeMobileController.text = widget.mobile;
    employeeHomeNumberController.text = widget.home;
    employeeHomeNumberController.text = widget.home;
    gender = widget.gender == 'Female' ? Gender.Female : Gender.Male;
    status = widget.status == 'Yes' ? MaritalStatus.Yes : MaritalStatus.No;
    employeeAddressController.text=widget.address;
    employeeIssueDateController.text=widget.issueDate;
    super.initState();
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
                      backgroundImage: NetworkImage(widget.employeeImage),
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
                        height: 40,
                        width: 160,
                        child: TextFormField(
                          controller: employeeIdController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                        width: 160,
                        child: TextFormField(
                          controller: employeeJobPositionController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                        width: 160,
                        child: TextFormField(
                          controller: employeeDepartmentController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                      Container(
                        height: 40,
                        width: 160,
                        child: TextFormField(
                          readOnly: true,
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1947),
                                lastDate: DateTime.now());

                            if (date != null) {
                              setState(() {
                                String formatedDate =
                                    DateFormat('dd-MM-yyyy').format(date);
                                employeeDOBController.text = formatedDate;
                              });
                            }
                          },
                          controller: employeeDOBController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                      Container(
                        height: 40,
                        width: 160,
                        child: TextFormField(
                          controller: employeeCountryController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                      Container(
                        height: 40,
                        width: 160,
                        child: TextFormField(
                          controller: employeeStateController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                      Container(
                        height: 40,
                        width: 160,
                        child: TextFormField(
                          controller: employeeCityController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                      Container(
                        height: 40,
                        width: 160,
                        child: TextFormField(
                          controller: employeeMobileController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                      Container(
                        height: 40,
                        width: 160,
                        child: TextFormField(
                          controller: employeeHomeNumberController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                            "Mail ID",
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
                        width: 160,
                        child: TextFormField(
                          controller: employeeEmailIdController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                        // height: 40,
                        width: 160,
                        child: TextFormField(
                          maxLines: 3,
                          controller: employeeAddressController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                        // height: 40,
                        width: 160,
                        child: TextFormField(
                          obscureText: true,
                          controller: employeePasswordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                        // height: 40,
                        width: 160,
                        child: TextFormField(
                          readOnly: true,
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1947),
                                lastDate: DateTime.now());

                            if (date != null) {
                              setState(() {
                                String formatedDate =
                                DateFormat('dd-MM-yyyy').format(date);
                                employeeIssueDateController.text = formatedDate;
                              });
                            }
                          },
                          controller: employeeIssueDateController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                          ),
                          style: TextStyle(fontSize: 14, color: blackColor),
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
                    (isEditLoading == true)
                        ? Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width / 2 - 100,
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
                              // if (formKey.currentState!.validate()) {
                              setState(() {
                                isEditLoading = true;
                              });
                              updateEmp().then((value) {
                                setState(() {
                                  isEditLoading = false;
                                });
                              });
                              // }
                            },
                            child: Container(
                              height: 55,
                              width:
                                  MediaQuery.of(context).size.width / 2 - 100,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: whiteColor, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                    (isDeleteLoading == true)
                        ? Container(
                            height: 55,
                            width: MediaQuery.of(context).size.width / 2 - 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            ),
                          )
                        : InkWell(
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
                              width:
                                  MediaQuery.of(context).size.width / 2 - 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 16),
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
