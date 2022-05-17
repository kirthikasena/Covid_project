import 'package:defcov/Components/gradient_button.dart';
import 'package:defcov/Screens/Recording%20Page/rec.dart';
import 'package:defcov/Screens/Recording%20Page/rec_home2.dart';
import 'package:defcov/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class RecorderHome1 extends StatefulWidget {
  final String text1;
  final String text2;

  const RecorderHome1({Key? key, required this.text1, required this.text2})
      : super(key: key);
  @override
  _RecorderHome1State createState() => _RecorderHome1State();
}

class _RecorderHome1State extends State<RecorderHome1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Background2Color1,
              Background2Color2,
            ],
          ),
        ),
        width: size.width,
        height: size.height,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Positioned(
            top: 0.27 * size.height,
            child: Text(
              widget.text1,
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ),
          Positioned(
            top: 0.33 * size.height,
            child: Text(
              widget.text2,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: -100,
            left: -120,
            child: Transform.rotate(
              angle: -49.79 * math.pi / 180,
              child: Image.asset(
                "images/Covid Virus.png",
              ),
            ),
          ),
          Positioned(
            child: Recorder(
              text: widget.text1,
            ),
          ),
          Positioned(
            bottom: 1 / 5 * size.height,
            left: 3 / 5 * size.width,
            child: GradientButton(
              text: "Proceed",
              pressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RecorderHome2(
                        text1: "Heavy cough",
                        text2: "",
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
