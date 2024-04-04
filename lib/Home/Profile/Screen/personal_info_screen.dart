import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../util/color.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

enum Gender { Male, Female }

enum MaritalStatus { Yes, No }

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  Gender gender = Gender.Male;
  MaritalStatus status = MaritalStatus.Yes;
  TextEditingController requestDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0),
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
                            contentPadding: EdgeInsets.symmetric(vertical: 0.1),
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
                            contentPadding: EdgeInsets.symmetric(vertical: 0.1),
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
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
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
                          "Address",
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
                      height: 100,
                      width: 160,
                      child: TextFormField(
                        maxLines: 3,
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
                          "Phome",
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
                        keyboardType: TextInputType.number,
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
              height: 100,
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
                          "Home Address",
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
                      height: 100,
                      width: 160,
                      child: TextFormField(
                        maxLines: 3,
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
                          "Emergence No",
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
                        keyboardType: TextInputType.number,
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
                      width: 100,
                      child: TextFormField(
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
                      width: 100,
                      child: TextFormField(
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40),
              child: InkWell(
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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
