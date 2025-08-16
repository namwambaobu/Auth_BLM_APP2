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

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
    );
  }
}