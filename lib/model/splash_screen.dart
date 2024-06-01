import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grad_project/controller/home_screen.dart';
import 'package:grad_project/model/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SigninScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF495E57),
      body: Center(
        child: Container(
          width: 366,
          height: 366,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/SUPPORT ME LOGO 1.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
