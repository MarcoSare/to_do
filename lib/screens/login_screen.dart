import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 21, 21, 21),
        body: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/login_img.gif",
                    height: 250,
                    width: 250,
                  ),
                  const Text(
                    "Login to your account",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  getTextField("Email", "Email", Icons.email, 50),
                  getTextPass("Password", "Password", 50),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      child: const Text("Login"),
                    ),
                  )
                ]),
          ),
        ));
  }

  Widget getTextField(
      String hintText, String labelText, IconData icon, int lenght) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(lenght)],
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.purple),
                borderRadius: BorderRadius.circular(20)),
            prefixIcon: Container(
              margin: const EdgeInsets.only(left: 14, right: 14),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            hintStyle: const TextStyle(color: Colors.white),
            labelStyle: const TextStyle(color: Colors.white),
            hintText: hintText,
            labelText: labelText),
      ),
    );
  }

  Widget getTextPass(String hintText, String labelText, int lenght) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: !isShow,
        inputFormatters: [LengthLimitingTextInputFormatter(lenght)],
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.purple),
                borderRadius: BorderRadius.circular(20)),
            prefixIcon: Container(
              margin: const EdgeInsets.only(left: 14, right: 14),
              child: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
            ),
            suffixIcon: Container(
              margin: const EdgeInsets.only(left: 14, right: 14),
              child: IconButton(
                icon: Icon(
                  isShow ? Icons.visibility : Icons.visibility_off,
                  color: isShow ? Colors.white : Colors.purple,
                ),
                onPressed: () {
                  setState(() {
                    isShow = !isShow;
                  });
                },
              ),
            ),
            hintStyle: const TextStyle(color: Colors.white),
            labelStyle: const TextStyle(color: Colors.white),
            hintText: hintText,
            labelText: labelText),
      ),
    );
  }
}
