import 'package:easydrive/OnBoarding.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer that lasts 3 seconds
    Timer(Duration(seconds: 3), () {
      // Navigate to the HomePage after 3 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/splashScreen.png'),
        ),
      ),
    );
  }
}