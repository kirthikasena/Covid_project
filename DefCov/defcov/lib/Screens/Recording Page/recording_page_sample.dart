import 'package:defcov/Components/gradient_button.dart';
import 'package:defcov/Screens/Recording%20Page/rec_home1.dart';
import 'package:defcov/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class RecPageSample extends StatelessWidget {
  const RecPageSample({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Background1Color,
      width: size.width,
      height: size.height,
      child: Stack(alignment: Alignment.center, children: <Widget>[
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
          bottom: -200,
          right: -140,
          child: Transform.rotate(
            angle: 102.76 * math.pi / 180,
            child: Image.asset(
              "images/Covid Virus.png",
            ),
          ),
        ),
        Positioned(
          top: 1 / 5 * size.height,
          child: Text(
            "Instructions",
            style: TextStyle(
              fontSize: 35,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 3 / 10 * size.height,
          child: Container(
            width: size.width * 0.9,
            child: Text(
              "⦿ You will be going through 6 pages to record 6 sounds. \n\n"
              "⦿ You have to give the sounds of Shallow cough, Heavy cough, Shallow breath, Fast counting, Vowel E and Vowel O as instructed in each page.\n\n"
              "⦿ Once you came to recording page,touch on the record button and give the relavant sound.recording will stop automatically after 4 seconds.\n\n"
              "⦿ Once the recording stops click on proceed button below.",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.15 * size.height,
          child: GradientButton(
            text: "Record",
            pressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RecorderHome1(
                      text1: "Shallow cough",
                      text2: "",
                    );
                  },
                ),
              );
            },
            col1: ButtonColor1,
            col2: ButtonColor2,
          ),
        ),
      ]),
    );
  }
}
