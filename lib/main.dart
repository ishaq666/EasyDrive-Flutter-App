import 'package:easydrive/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Splashscreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color:  Color(0xFF0A1066),
          foregroundColor: Colors.white,
          centerTitle: true
        ),
        
      ),
    );
  }
}