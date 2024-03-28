import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../util/color.dart';

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

  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    // TODO: implement initState
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
                controller: taskIdController,
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
                'Task Code',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: taskCodeController,
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
                'Task Name',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: taskNameController,
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
                'Assign To',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: assignToController,
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
                'Manager Name',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: managerNameController,
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
                'Current Status',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: currentStatusController,
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
                'Assign Date',
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: assignDateController,
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
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: endDateController,
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
                          endDateController.text = formatedDate;
                          var timeDate = endDate!.difference(startDate!).inDays;
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
                style: TextStyle(color: grayColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
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
            ],
          ),
        ),
      ),
    );
  }
}
