import 'package:flutter/material.dart';

class GoogleSignInBtn extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const GoogleSignInBtn({super.key, required this.title, required this.onTap});

  @override
  State<GoogleSignInBtn> createState() => _GoogleSignInBtnState();
}

class _GoogleSignInBtnState extends State<GoogleSignInBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              color: Colors.black.withOpacity(0.16),
            )
          ],
          borderRadius: BorderRadius.circular(16)
        ),
        child: Center(child:  Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/google_logo.png'),
            SizedBox(width: 16),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black
              ),
              ),
              
          ],
        )),
      ),
    );
  }
}