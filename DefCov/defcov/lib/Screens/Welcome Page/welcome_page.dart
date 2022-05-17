import 'package:defcov/Components/gradient_button.dart';
import 'package:defcov/Screens/Login%20Page/login_page.dart';
import 'package:defcov/Screens/Sign%20Up%20Page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:defcov/constants.dart';

class WelcomePage extends StatelessWidget {
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
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                top: -103,
                left: -100,
                child: Image.asset("images/Covid Virus.png")),
            Positioned(
                top: 0,
                right: -380,
                child: Image.asset("images/Covid Virus.png")),
            Positioned(top: 164, child: Image.asset("images/starting.png")),
            Positioned(
              bottom: 75,
              child: Container(
                height: 100,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GradientButton(
                      text: "Sign Up",
                      pressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpPage();
                            },
                          ),
                        );
                      },
                      col1: ButtonColor1,
                      col2: ButtonColor2,
                    ),
                    GradientButton(
                      text: "Login",
                      pressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
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
          ],
        ),
      ),
    );
  }
}
