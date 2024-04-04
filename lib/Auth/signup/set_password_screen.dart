import 'package:carparking/util/toast_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../util/color.dart';
import '../provider/auth_provider.dart';

class SetPasswordScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;

  const SetPasswordScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phone});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isNewPassword = true;
  bool isConfirmPassword = true;
  bool isLoading = false;

  Future signUp() async {
    final authProvider = Provider.of<AuthenticationProvider>(context, listen: false);
    try {
      await authProvider.createUser(
          widget.email, confirmPasswordController.text, widget.phone);
      ToastMessage().showSuccessMessage('Registered Successfully');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => MyHomePage()),
              (route) => false);
    } catch (e) {
      print(e);
      if (e.toString().contains('firebase_auth/email-already-in-use')) {
        ToastMessage().showErrorMessage(
            'The Email address is already in use by another account.');
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
                  height: 250,
                  child: Image.asset('assets/images/password.png'),
                ),
                Text('Set Password',
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
                          'New Password',
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
                              return 'Enter password';
                            } else if (value.length < 6) {
                              return 'Must be atleast 6 charcters';
                            }
                          },
                          obscureText: isNewPassword,
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
                          height: 20,
                        ),
                        Text(
                          'Confirm Password',
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          obscureText: isConfirmPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter confirm password';
                            } else if (value.length < 6) {
                              return 'Must be atleast 6 charcters';
                            } else if (passwordController.text != value) {
                              return 'Both password should be match.';
                            }
                          },
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              suffixIcon: (isConfirmPassword == true)
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isConfirmPassword = false;
                                        });
                                      },
                                      icon: Icon(CupertinoIcons.eye_slash_fill),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isConfirmPassword = true;
                                        });
                                      },
                                      icon: Icon(CupertinoIcons.eye_fill),
                                    ),
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 60,
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
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    signUp().then((value) {
                                      setState(() {
                                        isLoading = false;
                                      });

                                    });
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
                                      'Sign Up',
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
