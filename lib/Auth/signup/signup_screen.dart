import 'package:carparking/Auth/provider/auth_provider.dart';
import 'package:carparking/Auth/signup/set_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                    key: formKey,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter name';
                            }
                          },
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
                        Text(
                          'Enter Your Email',
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            } else if (!value.contains('@')) {
                              return 'Enter valid email';
                            }
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              suffixIcon: Icon(CupertinoIcons.mail),
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter phone number';
                            } else if (value.length != 10) {
                              return 'Enter valid phone number';
                            }
                          },
                          controller: mobileController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              suffixIcon:
                                  Icon(CupertinoIcons.device_phone_portrait),
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SetPasswordScreen(
                                        name: nameController.text,
                                        email: emailController.text,
                                        phone: mobileController.text,
                                      )));
                            }
                          },
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              boxShadow: [
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
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
