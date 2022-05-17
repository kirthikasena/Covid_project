import 'package:flutter/material.dart';
import 'package:defcov/constants.dart';

class Negative extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            "images/doodle.png",
          ),
        ),
        Positioned(
          bottom: -250,
          left: -100,
          child: Image.asset(
            "images/Covid Virus.png",
          ),
        ),
        Positioned(
          bottom: 30,
          right: 0,
          child: Image.asset(
            "images/Saly.png",
          ),
        ),
        Positioned(
          top: size.height * 0.3,
          child: Text(
            "Your Results",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: size.height * 0.4,
          child: Text(
            "wooohoo!! \n You tested Negative!",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
