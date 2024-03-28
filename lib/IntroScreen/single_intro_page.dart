import 'package:carparking/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleIntroScreen extends StatefulWidget {
  final String image;
  final String title;
  final String text;

  const SingleIntroScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.text});

  @override
  State<SingleIntroScreen> createState() => _SingleIntroScreenState();
}

class _SingleIntroScreenState extends State<SingleIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CustomPaint(
                painter: BackgroundPaint(),
                child: Container(
                  height: 450,
                  width: double.infinity,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child:
                    Image.asset(widget.image, height: 350, fit: BoxFit.contain),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 20),
                ),
                SizedBox(height: 20,),
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: blackColor, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    Path path = Path();
    paint.color = secondaryColor.withOpacity(0.6);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width , size.height, size.width * 1.5, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
