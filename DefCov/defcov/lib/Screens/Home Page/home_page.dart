import 'package:defcov/Components/gradient_button.dart';
import 'package:defcov/Screens/Recording%20Page/recording_page_1.dart';
import 'package:defcov/Screens/Results%20Page/result_page.dart';
import 'package:flutter/material.dart';
import 'package:defcov/constants.dart';
import 'dart:math' as math;
import 'package:shared_preferences/shared_preferences.dart';

String _email = '';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadCounter();
    print(_email);
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = (prefs.getString('email') ?? '');
    });
  }

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
            top: -50,
            left: -60,
            child: Transform.rotate(
              angle: -49.65 * math.pi / 180,
              child: Image.asset(
                "images/Covid Virus.png",
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.06,
            right: 0,
            child: Image.asset(
              "images/notepad.png",
            ),
          ),
          Positioned(
            top: 250,
            right: -400,
            child: Transform.rotate(
              angle: -49.65 * math.pi / 180,
              child: Image.asset(
                "images/Covid Virus.png",
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.1,
            child: Container(
              height: 100,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GradientButton(
                    text: "Take a test",
                    pressed: () {
                      print(_email);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RecPage1();
                          },
                        ),
                      );
                    },
                    col1: ButtonColor1,
                    col2: ButtonColor2,
                  ),
                  GradientButton(
                    text: "Check progress",
                    pressed: () {
                      print(_email);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultPage();
                          },
                        ),
                      );
                    },
                    col1: ButtonColor1,
                    col2: ButtonColor2,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.06,
            left: size.width * 0.04,
            child: Text(
              greeting(),
              style: TextStyle(fontSize: 30),
            ),
          ),
        ]),
      ),
    );
  }

  String greeting() {
    var time = DateTime.now().hour;

    if (time < 12) {
      return 'Good Morning';
    } else if ((time >= 12) && (time <= 16)) {
      return 'Good Afternoon';
    } else if ((time > 16) && (time <= 19)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }
}
