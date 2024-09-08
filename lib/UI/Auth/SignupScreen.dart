import 'package:easydrive/UI/login.dart';
import 'package:easydrive/widgets/roundbutton.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUpScreen> {
  bool loading = false;
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  // FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController
        .dispose(); //jab ye field na rhy to memory me se release krdo
    passwordController.dispose();
    nameController.dispose();
  }

/*  void login() {
    setState(() {
      loading = true;
    });

    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then(
      (value) {
        setState(() {
          loading = false;
        });
      },
    ).onError(
      (error, stackTrace) {
        Utils().toastMessage(error.toString());
        setState(() {
          loading = false;
        });
      },
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formField,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.alternate_email)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        hintText: 'Name',
                        prefixIcon: Icon(Icons.person_outline)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_open_outlined)),
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
            const SizedBox(
              height: 50,
            ),
            RoundButton(
              title: 'Sign Up',
              loading: loading,
              onTap: () {
                if (_formField.currentState!.validate()) {
                  //login();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
