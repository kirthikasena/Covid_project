// import 'dart:_http';
import 'dart:io';

import 'package:defcov/constants.dart';
import 'package:flutter/material.dart';
import 'package:defcov/Screens/Welcome Page/welcome_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DefCov',
      theme: ThemeData(
        // primaryColor: Background1Color,
        scaffoldBackgroundColor: Background1Color,
      ),
      home: WelcomePage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
