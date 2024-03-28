import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../util/color.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() =>
      _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
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
                child: Image.asset('assets/images/otp.png'),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'OTP verification',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'We have send 4 digit code to your mobile',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Enter OTP',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                style: TextStyle(
                    fontSize: 17
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
              SizedBox(height: 50,),
              Text('Resend OTP'),
              SizedBox(height: 30,),
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
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Verify',
                    style: TextStyle(
                        fontSize: 16,
                        color: whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
