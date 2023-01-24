import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_1/screens/login.dart';
import 'package:login_1/screens/splash.dart';
import 'package:login_1/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'loginsample',
      theme: ThemeData(primaryColor: Colors.grey),
      home: SplashScreen(),
    );
  }
}
