import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Auth/components/my_button.dart';
import 'package:flutter_application_1/Features/Auth/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function() togglePages;
  RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //Register button pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("R E G I S T E R")),
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
              "Let's create an account for you",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),
            //NAME
            MyTextfield(
              controller: nameController,
              hintText: "Name",
              obsecureText: false,
            ),
            const SizedBox(height: 10),
            //PHONE NUMBER
            MyTextfield(
              controller: phoneController,
              hintText: "Phone Number",
              obsecureText: false,
            ),
            const SizedBox(height: 10),

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
            const SizedBox(height: 10),
            //CONFIRM PASSWERD
            MyTextfield(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obsecureText: true,
            ),
            const SizedBox(height: 25),

            //SIGN UP BUTTON
            MyButton(onTap: () {}, text: "SIGN UP"),
            //OAUTH SIGN IN LATER.. (google + apple
            const SizedBox(height: 25),

            //ALREADY HAYE AN ACCOUNT SIGN UP
            Row(
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.togglePages,
                  child: Text(
                    "Log in.",
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
