import 'package:carparking/Auth/provider/auth_provider.dart';
import 'package:carparking/Home/Task/provider/task_provider.dart';
import 'package:carparking/Home/Task/task_screen.dart';
import 'package:carparking/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/color.dart';
import '../../util/toast_message.dart';

class ManageTaskScreen extends StatefulWidget {
  final String taskId;
  final String taskName;
  final String taskCode;
  final String assignTo;
  final String managerName;
  final String currentStatus;
  final String assignDate;
  final String endDate;
  final String timeTaken;
  final int index;

  const ManageTaskScreen({
    super.key,
    required this.taskId,
    required this.taskName,
    required this.taskCode,
    required this.assignTo,
    required this.managerName,
    required this.currentStatus,
    required this.assignDate,
    required this.endDate,
    required this.timeTaken,
    required this.index,
  });

  @override
  State<ManageTaskScreen> createState() => _ManageTaskScreenState();
}

class _ManageTaskScreenState extends State<ManageTaskScreen> {
  TextEditingController taskIdController = TextEditingController();
  TextEditingController taskCodeController = TextEditingController();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController assignToController = TextEditingController();
  TextEditingController managerNameController = TextEditingController();
  TextEditingController currentStatusController = TextEditingController();
  TextEditingController assignDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController timeTakenController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isMarkLoading = false;
  bool isDeleteLoading = false;
  DateTime? startDate;
  DateTime? endDate;
  String role = '';

  Future updateTask() async {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    try {
      await taskProvider.updateTask(
          widget.taskId,
          taskCodeController.text,
          taskNameController.text,
          assignToController.text,
          managerNameController.text,
          currentStatusController.text,
          assignDateController.text,
          endDateController.text,
          timeTakenController.text);
      ToastMessage().showSuccessMessage('Task Updated.');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => TaskScreen()),
          (route) => false);
    } catch (e) {
      print(e);
      ToastMessage().showErrorMessage('Something went wrong.');
    }
  }

  Future updateTaskStatus() async {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    try {
      await taskProvider.updateTaskStatus(
        widget.taskId,
      );
      ToastMessage().showSuccessMessage('Task Updated.');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyHomePage()),
          (route) => false);
    } catch (e) {
      print(e);
      ToastMessage().showErrorMessage('Something went wrong.');
    }
  }

  Future deleteTask() async {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    try {
      await taskProvider.deleteTask(
        widget.taskId,
      );
      ToastMessage().showSuccessMessage('Task Deleted.');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => TaskScreen()),
          (route) => false);
    } catch (e) {
      print(e);
      ToastMessage().showErrorMessage('Something went wrong.');
    }
  }

  @override
  void initState() {
    getData();
    // TODO: implement initStat
    taskIdController.text = widget.taskId;
    taskNameController.text = widget.taskName;
    taskCodeController.text = widget.taskCode;
    assignToController.text = widget.assignTo;
    managerNameController.text = widget.managerName;
    currentStatusController.text = widget.currentStatus;
    assignDateController.text = widget.assignDate;
    endDateController.text = widget.endDate;
    timeTakenController.text = widget.timeTaken;
    super.initState();
  }

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    role = pref.getString('role') ?? '';
    setState(() {});
    print(role);
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
            'Manage Task',
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
                  Text(
                    'Task Id',
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
                        return 'Enter Task Id';
                      }
                    },
                    controller: taskIdController,
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
                    'Task Code',
                    style: TextStyle(
                        color: grayColor, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Task code';
                      }
                    },
                    controller: taskCodeController,
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
                    'Task Name',
                    style: TextStyle(
                        color: grayColor, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Task name';
                      }
                    },
                    controller: taskNameController,
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
                    'Assign To',
                    style: TextStyle(
                        color: grayColor, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter assign to';
                      }
                    },
                    controller: assignToController,
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
                    'Manager Name',
                    style: TextStyle(
                        color: grayColor, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter manager name';
                      }
                    },
                    controller: managerNameController,
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
                    'Current Status',
                    style: TextStyle(
                        color: grayColor, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter current status';
                      }
                    },
                    controller: currentStatusController,
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
                    'Assign Date',
                    style: TextStyle(
                        color: grayColor, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter assign date';
                      }
                    },
                    controller: assignDateController,
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
                              assignDateController.text = formatedDate;
                              if (endDate != null) {
                                var timeDate =
                                    endDate!.difference(startDate!).inDays;
                                timeTakenController.text = '$timeDate Days';
                              }
                            });
                          }
                        },
                        icon: Icon(Icons.calendar_month),
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
                    'End Date',
                    style: TextStyle(
                        color: grayColor, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter end date';
                      }
                    },
                    controller: endDateController,
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
                              endDateController.text = formatedDate;
                              var timeDate =
                                  endDate!.difference(startDate!).inDays;
                              timeTakenController.text = '$timeDate Days';
                            });
                          }
                        },
                        icon: Icon(Icons.calendar_month),
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
                    'Time Taken',
                    style: TextStyle(
                        color: grayColor, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: timeTakenController,
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
                    child: (role == 'emp')
                        ? (isMarkLoading == true)
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
                                  setState(() {
                                    isMarkLoading = true;
                                  });
                                  updateTaskStatus().then((value) {
                                    setState(() {
                                      isMarkLoading = false;
                                    });
                                  });
                                },
                                child: Container(
                                  height: 55,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'Mark as Done',
                                      style: TextStyle(
                                          color: whiteColor, fontSize: 16),
                                    ),
                                  ),
                                ),
                              )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              (isLoading == true)
                                  ? Container(
                                      height: 55,
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          100,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          updateTask().then((value) {
                                            setState(() {
                                              isLoading = false;
                                            });
                                          });
                                        }
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
                                            'Edit',
                                            style: TextStyle(
                                                color: whiteColor,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ),
                              (isDeleteLoading == true)
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
                                          isDeleteLoading = true;
                                        });
                                        deleteTask().then((value) {
                                          setState(() {
                                            isDeleteLoading = false;
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
                                            'Delete',
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 16),
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
        ));
  }
}
