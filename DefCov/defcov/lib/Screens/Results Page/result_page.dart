import 'dart:io';

import 'package:defcov/Screens/Results%20Page/positive.dart';
import 'package:defcov/Screens/Results%20Page/negative.dart';
import 'package:flutter/material.dart';
import 'package:defcov/constants.dart';
import 'package:http/http.dart' as http;

const String results = "";

class ResultPage extends StatelessWidget {
  final String result;
  const ResultPage({
    Key? key,
    this.result = 'Negative',
  }) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ButtonColor1,
                ButtonColor3,
              ],
            ),
          ),
          child: result == "Negative" ? Negative() : Positive()),
    );
  }
}

// Future getData() async {
//   var response = await http.get(Uri.parse("http://10.0.2.2:5000/results"));
//   print(response.body);
//   return response.body;
// }

Future getresults(result_) async {
  return result_;
}
