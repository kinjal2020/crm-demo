import 'package:carparking/Home/Profile/provider/profile_provider.dart';
import 'package:carparking/util/toast_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../Auth/provider/auth_provider.dart';
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
  TextEditingController empIdController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController homeAddressController = TextEditingController();
  TextEditingController emergencyController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  bool isLoading = false;
  String docId = '';

  updatePersonalInfo() async {
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    try {
      await profileProvider.updatePersonalInfo(
          gender.name,
          status.name,
          addressController.text,
          phoneController.text,
          homeAddressController.text,
          emergencyController.text,
          cityController.text,
          stateController.text,
          docId);
      await authProvider.getLoginUserInfo();
      ToastMessage().showSuccessMessage('Personal Info Updated');
    } catch (e) {
      // TODO
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    docId = authProvider.doc!.docs[0].id;
    gender = authProvider.doc!.docs[0].data()['gender'] == 'Female'
        ? Gender.Female
        : Gender.Male;
    status = authProvider.doc!.docs[0].data()['maritalStatus'] == 'Yes'
        ? MaritalStatus.Yes
        : MaritalStatus.No;
    if (authProvider.role == 'emp') {
      empIdController.text = authProvider.doc!.docs[0].data()['employeeId'];
      addressController.text = authProvider.doc!.docs[0].data()['address'];
      phoneController.text = authProvider.doc!.docs[0].data()['mobileNumber'];
      homeAddressController.text =
          authProvider.doc!.docs[0].data()['homeNumber'];
      cityController.text = authProvider.doc!.docs[0].data()['city'];
      stateController.text = authProvider.doc!.docs[0].data()['state'];
    }
    super.initState();
  }

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
                        controller: empIdController,
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
                        controller: addressController,
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
                        controller: phoneController,
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
                      height: 100,
                      width: 160,
                      child: TextFormField(
                        controller: homeAddressController,
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
                        controller: emergencyController,
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
                        controller: cityController,
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
                        controller: stateController,
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
                        // if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        updatePersonalInfo().then((value) {
                          setState(() {
                            isLoading = false;
                          });
                        });
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
