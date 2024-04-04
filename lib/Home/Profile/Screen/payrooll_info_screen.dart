import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/color.dart';

class PayrollInfoScreen extends StatefulWidget {
  const PayrollInfoScreen({super.key});

  @override
  State<PayrollInfoScreen> createState() => _PayrollInfoScreenState();
}

class _PayrollInfoScreenState extends State<PayrollInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                          "Bank Name",
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
                          "Account Number",
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
                          "IFSC Code",
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
                          "MICR Number",
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
                          "Aadhaar Number",
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
                          "Pan Number",
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
                          "Branch",
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
                          "Pin COde",
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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40),
              child: InkWell(
                onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
