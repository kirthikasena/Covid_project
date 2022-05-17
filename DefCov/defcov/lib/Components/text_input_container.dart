import 'package:defcov/constants.dart';
import 'package:flutter/material.dart';

class TextInputContainer extends StatelessWidget {
  final Widget child;
  const TextInputContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
