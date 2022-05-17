// import 'dart:_http';
import 'dart:convert';

import 'package:defcov/Components/custom_input_field.dart';
import 'package:defcov/Components/custom_password_field.dart';
import 'package:defcov/Components/gradient_button.dart';
import 'package:defcov/Screens/Home%20Page/home_page.dart';
import 'package:defcov/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() {
    return SignUpPageState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class SignUpPageState extends State<SignUpPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  // final _name = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  Future postUser(email, password) async {
    Map data = {
      'email': email,
      'password': password,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse("http://10.0.2.2:8080/api/users"),
        headers: {"Content-Type": "application/json"}, body: body);

    var apiResponseData = jsonDecode(response.body);
    print('apiResponseData: ${apiResponseData['status']}');
    print("${response.statusCode}");
    print("${response.body}");

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(apiResponseData['message']),
        );
      },
    ); // return response;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var email;
    var password;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              bottom: -20,
              right: -100,
              child: Image.asset(
                "images/Covid Virus (1).png",
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "images/DNA.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Let's",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    child: Text(
                      "Sign YOU IN",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            controller: _email,
                            decoration: const InputDecoration(
                              icon: const Icon(
                                Icons.person,
                                color: ButtonColor1,
                              ),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Email';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              email = newValue;
                            },
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              icon: const Icon(
                                Icons.lock,
                                color: ButtonColor1,
                              ),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                            onSaved: (newValue) {
                              password = newValue;
                            },
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              icon: const Icon(
                                Icons.lock,
                                color: ButtonColor1,
                              ),
                              hintText: 'Confirm password',
                              border: InputBorder.none,
                            ),
                            onSaved: (newValue) {
                              password = newValue;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 80.0,
                            bottom: 100.0,
                          ),
                          child: GradientButton(
                              text: "Sign Up",
                              pressed: () async {
                                _formKey.currentState?.save();
                                print(email);
                                postUser(email, password);
                                final SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString('email', email);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return HomePage();
                                    },
                                  ),
                                );
                              },
                              col1: ButtonColor1,
                              col2: ButtonColor2),
                        ),
                      ],
                    ),
                  ),
                  // CustomInputField(
                  //   hintText: "Input your Email here",
                  //   onChanged: (value) {
                  //     value = email;
                  //   },
                  // ),

                  // CustomPasswordField(
                  //   onChanged: (value) {
                  //     value = Password;
                  //   },
                  // ),
                  // Flexible(
                  //   child: Padding(
                  //     padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 100.0),
                  //     child: GradientButton(
                  //         // Text(textsi),
                  //         text: "Sign up",
                  //         pressed: () {
                  //           // print(email);
                  //           // Navigator.push(
                  //           //   context,
                  //           //   MaterialPageRoute(
                  //           //     builder: (context) {
                  //           //       return HomePage();
                  //           //     },
                  //           //   ),
                  //           // );
                  //         },
                  // col1: ButtonColor1,
                  // col2: ButtonColor2),
                ],
              ),
            )
          ],
        ),
      ),
    );
    // ),
    //     ),
    //   ),
    // );
  }
}
