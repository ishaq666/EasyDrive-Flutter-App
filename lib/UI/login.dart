import 'package:easydrive/OnBoarding.dart';
import 'package:easydrive/UI/Auth/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:easydrive/widgets/googleSigninBtn.dart';
import 'package:easydrive/widgets/roundbutton.dart';
import 'package:easydrive/UI/parentScreen.dart';
import 'package:easydrive/UI/driverScreen.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/easyDrive-logo.png', height: MediaQuery.of(context).size.height * 0.2),
                Form(
                  key: _formField,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.alternate_email),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock_open_outlined),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Password';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                RoundButton(
                  title: 'Login',
                  onTap: () {
                    if (_formField.currentState!.validate()) {
                      if (user == 0) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Parentscreen()));
                      } else if (user == 1) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Driverscreen()));
                      }
                    }
                  },
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                      },
                      child: const Text('Signup',style: TextStyle(
                        color: Colors.deepPurple
                      ),),
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                GoogleSignInBtn(title: 'Continue with Google', onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
