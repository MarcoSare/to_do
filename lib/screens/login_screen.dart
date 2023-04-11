import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("To do activities"),
            Image.asset(
              "assets/images/login_img.gif",
              height: 250,
              width: 250,
            ),
            const Text("Login to your account"),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: "email", labelText: "email"),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "Password", labelText: "Password"),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Login"))
          ]),
    ));
  }
}
