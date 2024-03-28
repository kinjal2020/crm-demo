import 'package:carparking/Auth/welcome_screen.dart';
import 'package:carparking/IntroScreen/single_intro_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/color.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController controller = PageController();
  List<Widget> _list = <Widget>[
    new Center(
        child: new SingleIntroScreen(
      title: 'Attendance Tracking',
      image: 'assets/images/attendance.png',
      text:
          'Now you can easily to access the punch in or punch out for upcoming weeks.',
    )),
    new Center(
        child: new SingleIntroScreen(
      title: 'Secret Locker',
      image: 'assets/images/locker.png',
      text: 'Now you can easily save Document with safe and secure.',
    )),
    new Center(
        child: new SingleIntroScreen(
      title: 'Notification',
      image: 'assets/images/notification.png',
      text:
          'Now you can easily to view Notification of leave approvals, Task assignment etc.',
    )),
  ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: _list,
          scrollDirection: Axis.horizontal,

          // reverse: true,
          // physics: BouncingScrollPhysics(),
          controller: controller,
          onPageChanged: (num) {
            setState(() {
              _curr = num;
            });
          },
        ),
        bottomNavigationBar: (_curr == _list.length - 1)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()),
                        (route) => false);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 16,
                            color: whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    TextButton(
                        onPressed: () {
                          // if (_curr != _list.length - 1)
                          //   setState(() {
                          //     controller.jumpToPage(_curr + 1);
                          //   });
                        },
                        child: Text('SKIP')),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List<Widget>.generate(
                            _list.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: InkWell(
                                    onTap: () {
                                      controller.animateToPage(index,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn);
                                    },
                                    child: CircleAvatar(
                                      radius: 3,
                                      backgroundColor: _curr == index
                                          ? purpleColor
                                          : grayColor,
                                    ),
                                  ),
                                )),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          if (_curr != _list.length - 1)
                            setState(() {
                              controller.jumpToPage(_curr + 1);
                            });
                        },
                        child: Text('NEXT')),
                  ]));
  }
}
