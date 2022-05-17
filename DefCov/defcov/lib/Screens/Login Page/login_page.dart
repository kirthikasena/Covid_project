import 'package:defcov/Components/custom_input_field.dart';
import 'package:defcov/Components/custom_password_field.dart';
import 'package:defcov/Components/gradient_button.dart';
import 'package:defcov/Screens/Home%20Page/home_page.dart';
import 'package:defcov/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_session/flutter_session.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  // var session = FlutterSession();
  //  await session.set("token", myJWTToken);
  final _formKey = GlobalKey<FormState>();
  // final _name = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  Future postUser(email, password) async {
    print("hi from post");
    Map data = {
      'email': email,
      'password': password,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse("http://10.0.2.2:8080/api/auth"),
        headers: {"Content-Type": "application/json"}, body: body);

    var apiResponseData = jsonDecode(response.body);
    print('apiResponseData: ${apiResponseData['status']}');
    print("${response.statusCode}");
    print("${response.body}");

    // return response.statusCode,;

    if (response.statusCode != 200) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(apiResponseData['message']),
          );
        },
      ); // return response;

    }
    return response.statusCode;
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(50, 0.0, 0.0, 80),
                            child: Text(
                              "Login IN",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Image.asset(
                              "images/login.png",
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
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
                            // CustomInputField(
                            //   hintText: "Input your Email here",
                            //   onChanged: (value) {},

                            // ),
                            // CustomPasswordField(
                            //   onChanged: (value) {},
                            // ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  80.0, 60.0, 0.0, 50.0),
                              child: GradientButton(
                                  text: "Log In",
                                  pressed: () async {
                                    _formKey.currentState?.save();
                                    var r = postUser(email, password);
                                    if (r != 200) {
                                      return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AlertDialog(
                                            content: Text("please try again"),
                                          );
                                        },
                                      );
                                    }
                                    print(email);

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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
