import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/color.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isNewPassword = true;
  bool isConfirmPassword = true;

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
                  Text(
                    'Must be atleast 8 charaters.',
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
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
                  Text(
                    'Both should be match.',
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),

                  SizedBox(
                    height: 60,
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
                        'Login',
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
