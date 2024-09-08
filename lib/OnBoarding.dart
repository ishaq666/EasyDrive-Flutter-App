import 'package:flutter/material.dart';
import 'package:easydrive/widgets/OnBoardingBtn.dart';

// Define the global variable
int user = -1;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  void setUser(int value) {
    setState(() {
      user = value;
    });
    print('User value set to: $user');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(image: AssetImage('assets/images/screen.png')),
          Positioned(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnBoardingBtn(
                    text: 'Parent',
                    onTap: () => setUser(0),
                    imagePath: 'assets/images/home.png',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  OnBoardingBtn(
                    text: 'Driver',
                    onTap: () => setUser(1),
                    imagePath: 'assets/images/car.png',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
