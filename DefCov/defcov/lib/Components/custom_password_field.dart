import 'package:defcov/Components/text_input_container.dart';
import 'package:defcov/constants.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const CustomPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputContainer(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Input you password here",
          icon: Icon(
            Icons.lock,
            color: ButtonColor1,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
