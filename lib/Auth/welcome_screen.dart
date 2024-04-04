import 'package:carparking/Auth/choice_screen.dart';
import 'package:carparking/Auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 450,
            child: Image.asset('assets/images/choice.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Welcome !',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Login if you are HR or Employee.',
                  style: TextStyle(color: blackColor, fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString('role', 'hr');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChoiceScreen()));
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'HR',
                      style: TextStyle(color: whiteColor, fontSize: 18),
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('OR'),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString('role', 'emp');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginScreen()));
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'Employee',
                      style: TextStyle(color: blackColor, fontSize: 18),
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
