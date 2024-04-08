import 'dart:io';

import 'package:carparking/Home/Employee/provider/employee_provider.dart';
import 'package:carparking/util/toast_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../../util/color.dart';

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
  TextEditingController employeeConfirmPasswordController =
      TextEditingController();
  TextEditingController employeeEmailIdController = TextEditingController();
  TextEditingController employeeJobPositionController = TextEditingController();
  TextEditingController employeeDepartmentController = TextEditingController();
  TextEditingController employeeTeamController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future addEmployee() async {
    final employeeProvider =
        Provider.of<EmployeeProvider>(context, listen: false);

    try {
      await employeeProvider.addEmployee(
          employeeFirstNameController.text,
          employeeLastNameController.text,
          imageFile,
          employeePasswordController.text,
          employeeEmailIdController.text,
          employeeJobPositionController.text,
          employeeDepartmentController.text,
          employeeTeamController.text,
          employeeIdController.text);
      ToastMessage().showSuccessMessage('Employee Added');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => MyHomePage()),
              (route) => false);

    }  catch (e) {
      // TODO
    }
  }

  pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
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
          child: Form(
            key: formKey,
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
                                    shape: BoxShape.circle,
                                    color: primaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: whiteColor,
                                    size: 22,
                                  ),
                                )),
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Employee Id';
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
                  'First Name',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter employee first name';
                    }
                  },
                  controller: employeeFirstNameController,
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
                  'Last Name',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter employee last name';
                    }
                  },
                  controller: employeeLastNameController,
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
                  'Password',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter password';
                    }
                  },
                  controller: employeePasswordController,
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
                  'Confirm Password',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter password';
                    } else if (employeePasswordController.text != value) {
                      return 'password and confirm password should be same.';
                    }
                  },
                  controller: employeeConfirmPasswordController,
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
                  'Email Id',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email';
                    } else if (!value.contains('@')) {
                      return 'Enter valid email';
                    }
                  },
                  controller: employeeEmailIdController,
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
                  'Job Position',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter job position';
                    }
                  },
                  controller: employeeJobPositionController,
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
                  'Department',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter department';
                    }
                  },
                  controller: employeeDepartmentController,
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
                  'Team',
                  style:
                      TextStyle(color: grayColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter team';
                    }
                  },
                  controller: employeeTeamController,
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
                              if (imageFile == null) {
                                ToastMessage().showErrorMessage('Pick Image');
                              } else {
                                setState(() {
                                  isLoading = true;
                                });
                                addEmployee().then((value) {
                                  setState(() {
                                    isLoading = false;
                                  });

                                });
                              }
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
                                'Save',
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
