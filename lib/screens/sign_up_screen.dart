import 'package:flutter/material.dart';
import 'package:todolist_app/components/my_button.dart';
import 'package:todolist_app/components/my_textfield.dart';
import 'package:todolist_app/constant/constant.dart';
import 'package:todolist_app/screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final re_passswordController = TextEditingController();

  void signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print("Created Account!");
    } on FirebaseAuthException catch (e) {
      print("Failed to create Account!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change background color to white
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 80, 15, 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to I-BIT community',
                style: textTitle,
              ),
              const SizedBox(height: 20),
              Text(
                'To get started, please provide your information to create account',
                style: textSubTitle,
              ),
              const SizedBox(height: 30),
              MyTextField(
                  controller: nameController,
                  hintText: 'Enter your name',
                  obscureText: false,
                  labelText: 'Name'),
              const SizedBox(height: 30),
              MyTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  obscureText: false,
                  labelText: 'Email'),
              const SizedBox(height: 30),
              MyTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                  labelText: 'Password'),
              const SizedBox(height: 30),
              MyTextField(
                  controller: re_passswordController,
                  hintText: 'Enter your password again',
                  obscureText: true,
                  labelText: 'Confirm Password'),
              const SizedBox(height: 30),
              MyButton(onTap: signUp, hinText: 'Register now'),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already a member?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
