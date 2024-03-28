import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                child: Image.asset('assets/images/signin.png'),
              ),
              Text('Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Your Name',
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   'Enter Your Id',
                  //   style: TextStyle(
                  //       color: blackColor,
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w500),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // TextFormField(
                  //   controller: idController,
                  //   decoration: InputDecoration(
                  //       contentPadding: EdgeInsets.symmetric(
                  //           vertical: 10.0, horizontal: 10),
                  //       suffixIcon: Icon(CupertinoIcons.creditcard_fill),
                  //       border: OutlineInputBorder()),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Text(
                    'Enter Your Mobile',
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: mobileController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        suffixIcon: Icon(CupertinoIcons.device_phone_portrait),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      boxShadow: [
                        // BoxShadow(color: purpleColor, blurRadius: 5),
                        // BoxShadow(color: purpleColor, blurRadius: 1),
                        // BoxShadow(color: purpleColor, blurRadius: 1),
                        BoxShadow(
                          color: primaryColor,
                          blurRadius: 1,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 16,
                            color: whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
