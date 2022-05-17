import 'package:flutter/material.dart';
import 'package:defcov/constants.dart';

class Positive extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            "images/Safety.png",
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
          bottom: 100,
          right: -100,
          child: Image.asset(
            "images/Quarantine Period.png",
          ),
        ),
        Positioned(
          top: size.height * 0.35,
          child: Text(
            "Your Results",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: size.height * 0.45,
          child: Text(
            "You tested positive!",
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: size.height * 0.55,
          left: 10,
          child: Container(
            width: size.width * 0.5,
            child: Text(
              "We recommand you to take a PCR test",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    );
  }
}
