import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundButton extends StatelessWidget {
  bool loading;
  final String title;
  final VoidCallback onTap;
   RoundButton({super.key, required this.title, required this.onTap, this.loading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 10, 16, 102),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Center(child:loading? const CircularProgressIndicator(strokeWidth:3,color:  Colors.white,) : Text(
          title,
          style: const TextStyle(
            color: Colors.white
          ),
          )),
      ),
    );
  }
}