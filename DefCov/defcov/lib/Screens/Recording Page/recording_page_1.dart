import 'package:defcov/Screens/Recording%20Page/recording_page_sample.dart';
import 'package:flutter/material.dart';

class RecPage1 extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RecPageSample(
        size: size,
      ),
    );
  }
}
