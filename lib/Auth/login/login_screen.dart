import 'package:carparking/Auth/signup/otp_verification_screen.dart';
import 'package:carparking/main.dart';
import 'package:carparking/util/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/toast_message.dart';
import '../provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isNewPassword = true;

  bool isLoading = false;

  Future signIn() async {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    try {
      await authProvider.loginUser(idController.text, passwordController.text);
      ToastMessage().showSuccessMessage('Login Successfully');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyHomePage()),
          (route) => false);
    } catch (e) {
      print(e);
      if (e.toString().contains('firebase_auth/invalid-credential')) {
        ToastMessage().showErrorMessage('Invalid Credential.Please try again.');
      }
    }
  }

  Future signInEmp() async {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    try {
      var data = await FirebaseFirestore.instance
          .collection('employee')
          .where('emailId', isEqualTo: idController.text)
          .get();
      print(data.docs.length);
      if (data.docs.length == 1) {
        print(data.docs[0]['password']);
        if (data.docs[0]['password'] == passwordController.text) {
          var user1 = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: idController.text, password: passwordController.text);

          authProvider.user = user1.user;
          ToastMessage().showSuccessMessage('Login Successfully');
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MyHomePage()),
              (route) => false);
        } else {
          ToastMessage()
              .showErrorMessage('Invalid Credential.Please try again.');
        }
      } else {
        ToastMessage().showErrorMessage('Invalid Credential.Please try again.');
      }
    } catch (e) {
      print(e);
      if (e.toString().contains('firebase_auth/email-already-in-use')) {
        signIn();
      }
    }
  }

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
                Text('Login',
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            } else if (!value.contains('@')) {
                              return 'Enter valid email';
                            }
                          },
                          controller: idController,
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
                          'Password',
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          obscureText: isNewPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter password';
                            } else if (value.length < 6) {
                              return 'Must be atleast 6 charcters';
                            }
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              suffixIcon: (isNewPassword == true)
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isNewPassword = false;
                                        });
                                      },
                                      icon: Icon(CupertinoIcons.eye_slash_fill),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isNewPassword = true;
                                        });
                                      },
                                      icon: Icon(CupertinoIcons.eye_fill),
                                    ),
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        (isLoading == true)
                            ? Container(
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
                                  child: CircularProgressIndicator(
                                    color: whiteColor,
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () async {
                                  SharedPreferences pref =
                                      await SharedPreferences.getInstance();
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    if (pref.getString('role') == 'emp') {
                                      signInEmp().then((value) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      });
                                    } else {
                                      signIn().then((value) {
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
                                      'Login',
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
