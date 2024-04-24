import 'package:flutter/material.dart';

import '../../util/color.dart';

class ShiftDetailsScreen extends StatefulWidget {
  const ShiftDetailsScreen({super.key});

  @override
  State<ShiftDetailsScreen> createState() => _ShiftDetailsScreenState();
}

class _ShiftDetailsScreenState extends State<ShiftDetailsScreen> {
  int date = 0;
  String month = '';

  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  @override
  void initState() {
    // TODO: implement initState
    findFirstDateOfTheWeek(DateTime.now());
    super.initState();
  }

  findFirstDateOfTheWeek(DateTime dateTime) {
    var date = dateTime.subtract(Duration(days: dateTime.weekday - 1));
    this.date = date.day;
    // month = date.;
  }

  DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Shift Details',
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
                'Your Shift For This Week : ',
                style: TextStyle(color: grayColor),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: height - 200,
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: grayColor.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: (width - 50) / 3,
                                child: Text(
                                  '${date + index}\n May',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: grayColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Container(
                                  width: 2.5,
                                  color: grayColor.withOpacity(0.5),
                                ),
                              ),
                              Container(
                                width: (width - 50) / 3,
                                child: Text(
                                  days[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: grayColor),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Container(
                                  width: 2.5,
                                  color: grayColor.withOpacity(0.5),
                                ),
                              ),
                              Container(
                                width: (width - 50) / 3,
                                child: Text(
                                  'Morning Shift',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
