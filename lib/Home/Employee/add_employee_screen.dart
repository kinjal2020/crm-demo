import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../util/color.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  File? imageFile;
  TextEditingController employeeIdController = TextEditingController();
  TextEditingController employeeFirstNameController = TextEditingController();
  TextEditingController employeeLastNameController = TextEditingController();
  TextEditingController employeePasswordController = TextEditingController();
  TextEditingController employeeConfirmPasswordController = TextEditingController();
  TextEditingController employeeEmailIdController = TextEditingController();
  TextEditingController employeeJobPositionController = TextEditingController();
  TextEditingController employeeDepartmentController = TextEditingController();
  TextEditingController employeeTeamController = TextEditingController();

  pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
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
          'Add Employee',
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.w400),
        ),
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  children: [
                    (imageFile == null)
                        ? Container(
                            width: 120,
                            height: 120,
                            child: Center(
                              child: Text('Add'),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              shape: BoxShape.circle,
                            ),
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(imageFile!),
                          ),
                    Positioned(
                        top: 80,
                        left: 85,
                        child: InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: primaryColor),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: whiteColor,
                                size: 22,
                              ),
                            )
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
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
                controller: employeeIdController,
                decoration: InputDecoration(
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
                'First Name',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: employeeFirstNameController,
                decoration: InputDecoration(
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
                'Last Name',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: employeeLastNameController,
                decoration: InputDecoration(
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
                'Password',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: employeePasswordController,
                decoration: InputDecoration(
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
                'Confirm Password',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: employeeConfirmPasswordController,
                decoration: InputDecoration(
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
                'Email Id',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: employeeEmailIdController,
                decoration: InputDecoration(
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
                'Job Position',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: employeeJobPositionController,
                decoration: InputDecoration(
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
                'Department',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: employeeDepartmentController,
                decoration: InputDecoration(
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
                'Team',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: employeeTeamController,
                decoration: InputDecoration(
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(color: whiteColor, fontSize: 16),
                    ),
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
