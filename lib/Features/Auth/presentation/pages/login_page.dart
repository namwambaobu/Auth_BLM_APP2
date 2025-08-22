/*

LOGIN PAGE
on this page the user is able to login with their :
  - email
     - password
 ------------------------------------------------------------------
 ------------------------------------------------------------------------------------------------------------------------------------
 Once the user successfully logs in, they are directed to the homepage

 If the user doesn't have an account, they can go to register page abd create an account
 */

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Auth/components/my_button.dart';
import 'package:flutter_application_1/Features/Auth/components/my_textfield.dart';
import 'package:flutter_application_1/Features/Auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  final void Function() togglePages;
  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _loginPageState();
}

// ignore: camel_case_types
class _loginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  late final authCubit = context.read<AuthCubit>();

  void Login() {
    final String email = emailController.text.trim();
    final String pw = pwController.text;

    if (email.isNotEmpty && pw.isNotEmpty) {
      authCubit.login(email, pw);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both email and password!")),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  void openForgortPassword() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Forgot Password"),
        content: MyTextfield(
          controller: emailController,
          hintText: "Enter your email",
          obsecureText: false,
        ),
        actions: [
          //cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          //reset button
          TextButton(
            onPressed: () async {
              String message = await authCubit.forgortPassword(
                emailController.text,
              );
              if (message ==
                  "Password reset Email sent! Please check your inbox") {
                Navigator.pop(context);
                emailController.clear();
              }
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            child: Text("Reset"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //SCAFFOLD
    return Scaffold(
      //APPBAR
      //BODY
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 25),
            //Aappname
            Text(
              "B U I L D  L A U N CH  M O N E T I Z E",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            //EMAIL  TEXT FIELD
            MyTextfield(
              controller: emailController,
              hintText: "Email",
              obsecureText: false,
            ),
            const SizedBox(height: 10),

            //pASSWORD TEXTFIELD
            MyTextfield(
              controller: pwController,
              hintText: "Password",
              obsecureText: true,
            ),
            const SizedBox(height: 25),
            //FORGOT PASSWORD
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => openForgortPassword(),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            //LOGIN BUTTON
            MyButton(onTap: Login, text: "Login"),
            //OAUTH SIGN IN LATER.. (google + apple
            //
            //DO NOT HAYE AN ACCOUNT SIGN UP
            Row(
              children: [
                Text(
                  "Dont have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.togglePages,
                  child: Text(
                    "Register now.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            //
            //
          ],
        ),
      ),
    );
  }
}
