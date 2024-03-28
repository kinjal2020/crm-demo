import 'package:flutter/material.dart';

import '../../util/color.dart';

class ShiftDetailsScreen extends StatefulWidget {
  const ShiftDetailsScreen({super.key});

  @override
  State<ShiftDetailsScreen> createState() => _ShiftDetailsScreenState();
}

class _ShiftDetailsScreenState extends State<ShiftDetailsScreen> {
  @override
  Widget build(BuildContext context) {
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
                height: MediaQuery.of(context).size.height - 200,
                child: ListView.builder(
                    itemCount: 7,
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
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
                                child: Text(
                                  '06\n September',
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
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
                                child: Text(
                                  'Monday',
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
                                width:
                                    (MediaQuery.of(context).size.width - 50) /
                                        3,
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
