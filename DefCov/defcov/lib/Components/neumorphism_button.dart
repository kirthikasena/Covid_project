import 'package:flutter/material.dart';

import '../constants.dart';

class NeumorphismButton extends StatefulWidget {
  const NeumorphismButton({Key? key}) : super(key: key);

  @override
  State<NeumorphismButton> createState() => _NeumorphismButtonState();
}

class _NeumorphismButtonState extends State<NeumorphismButton> {
  bool _isElevated = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isElevated = !_isElevated;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 200,
        ),
        height: 50,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
          boxShadow: _isElevated
              ? [
                  const BoxShadow(
                    color: ButtonColor1,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Background2Color2,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}
// height: 50.0,
//       child: RaisedButton(
//         onPressed: pressed,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//         padding: EdgeInsets.all(0.0),
//         child: Ink(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [col1, col2],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//               borderRadius: BorderRadius.circular(5.0)),
//           child: Container(
//             constraints: BoxConstraints(maxWidth: 130.0, minHeight: 50.0),
//             alignment: Alignment.center,
//             child: Text(
//               text,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ),