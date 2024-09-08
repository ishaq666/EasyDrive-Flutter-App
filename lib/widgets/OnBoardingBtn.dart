import 'package:easydrive/UI/login.dart';
import 'package:flutter/material.dart';

class OnBoardingBtn extends StatefulWidget {
  final String text;
  final String imagePath; // Add this line
  final VoidCallback onTap;

  const OnBoardingBtn({super.key, required this.text, required this.onTap, required this.imagePath}); // Modify this line

  @override
  State<OnBoardingBtn> createState() => _OnBoardingBtnState();
}

class _OnBoardingBtnState extends State<OnBoardingBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: Color(0xFF0A1066),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imagePath,
              height: MediaQuery.of(context).size.height * 0.1, // Adjust the height as needed
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10), // Space between image and text
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
