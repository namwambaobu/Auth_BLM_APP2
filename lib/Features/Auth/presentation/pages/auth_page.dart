/*

Auth Page - Determines whether to show the login page or the Register page

*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Auth/presentation/pages/login_page.dart';
import 'package:flutter_application_1/Features/Auth/presentation/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //Initially show thw Login page
  bool showLoginPage = true;

  //toggle method to move between the pages
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(togglePages: togglePages);
    } else {
      return RegisterPage(togglePages: togglePages);
    }
  }
}
