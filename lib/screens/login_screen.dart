import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:to_do/widgets/email_field.dart';
import 'package:to_do/widgets/pass_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  EmailField emailField = EmailField(
      label: "Email", hint: "Email", msgError: "Email or password wrong");
  PassField passField = PassField(
      label: "Password", hint: "Password", msgError: "Email or password wrong");

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
                  emailField,
                  passField,
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
                            onPressed: () {
                              Navigator.pushNamed(context, "/register");
                            },
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
}
