import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShow = false;
  var controlerEmail;
  final btnGoogle = SocialLoginButton(
    buttonType: SocialLoginButtonType.google,
    text: "",
    width: 77,
    borderRadius: 15,
    mode: SocialLoginButtonMode.single,
    onPressed: () {},
  );
  final btnApple = SocialLoginButton(
    buttonType: SocialLoginButtonType.apple,
    text: "",
    onPressed: () {},
    width: 77,
    borderRadius: 15,
    mode: SocialLoginButtonMode.single,
  );
  final btnFB = SocialLoginButton(
    buttonType: SocialLoginButtonType.facebook,
    text: "",
    width: 77,
    mode: SocialLoginButtonMode.single,
    borderRadius: 15,
    onPressed: () {},
  );

  final btnLogin = Padding(
    padding: const EdgeInsets.all(8.0),
    child: SocialLoginButton(
      buttonType: SocialLoginButtonType.generalLogin,
      backgroundColor: Colors.purple,
      onPressed: () {},
      borderRadius: 15,
    ),
  );

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
                  getTextEmail(50),
                  getTextPass("Password", "Password", 50),

                  /*SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      child: const Text("Login"),
                    ),
                  ),*/

                  btnLogin,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [btnGoogle, btnApple, btnFB],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Do you have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Create your account",
                              style: TextStyle(color: Colors.purpleAccent),
                            )),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget your password?",
                        style: TextStyle(color: Colors.purpleAccent),
                      )),
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

  Widget getTextEmail(int lenght) {
    return Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            inputFormatters: [LengthLimitingTextInputFormatter(lenght)],
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(20)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20)),
                prefixIcon: Container(
                  margin: const EdgeInsets.only(left: 14, right: 14),
                  child: const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                ),
                hintStyle: const TextStyle(color: Colors.white),
                labelStyle: const TextStyle(color: Colors.white),
                hintText: "Email",
                labelText: "Email"),
            onSaved: (value) {
              controlerEmail = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter an email";
              } else if (!EmailValidator.validate(value!)) {
                return "Enter email valited";
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              setState(() {
                controlerEmail = value;
              });
            },
          ),
        ));
  }

  /*
  if (EmailValidator.validate(value!)) {
            return "Enter email valited";
          }
  */

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
                  color: isShow ? Colors.purple : Colors.white,
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
