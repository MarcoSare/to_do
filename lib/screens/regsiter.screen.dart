import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:to_do/models/user_model.dart';
import 'package:to_do/network/api_user.dart';
import 'package:to_do/widgets/down_list_gender.dart';
import 'package:to_do/widgets/email_field.dart';
import 'package:to_do/widgets/pass_field.dart';
import 'package:to_do/widgets/text_field.dart';
import 'package:http/http.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ApiUser apiUser = ApiUser();
  TextFieldWidget firstName = TextFieldWidget(
    label: "First name",
    hint: "First name",
    msgError: "",
    inputType: 1,
    lenght: 50,
    icono: Icons.account_circle,
  );
  TextFieldWidget lastName = TextFieldWidget(
    label: "Last name",
    hint: "Last name",
    msgError: "",
    inputType: 1,
    lenght: 50,
    icono: Icons.account_circle,
  );
  EmailField emailField = EmailField(
      label: "Email", hint: "Email", msgError: "Email or password wrong");
  PassField passField = PassField(
      label: "Password", hint: "Password", msgError: "Email or password wrong");
  DownListGender downListGender = DownListGender();

  bool validateForm() {
    if (firstName.formkey.currentState!.validate()) {
      if (lastName.formkey.currentState!.validate()) {
        if (emailField.formkey.currentState!.validate()) {
          if (passField.formkey.currentState!.validate()) {
            return true;
          }
        }
      }
    }
    return false;
  }

  Future<void> registerUser() async {
    final userModel = UserModel(
      firstName: firstName.controlador,
      lastName: lastName.controlador,
      email: emailField.controlador,
      password: passField.controlador,
      gender: downListGender.control!,
    );
    bool flag = await apiUser.register(userModel);
    if (flag) {
      print("El usuario se inserto");
    } else {
      print("ocurrio un error inesperado");
    }
  }

  @override
  Widget build(BuildContext context) {
    final btnRegister = Padding(
      padding: const EdgeInsets.all(8.0),
      child: SocialLoginButton(
        buttonType: SocialLoginButtonType.generalLogin,
        backgroundColor: Colors.purple,
        onPressed: () {
          if (validateForm()) {
            registerUser();
          }
        },
        borderRadius: 15,
        text: "Register",
      ),
    );

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
                    "Create your account",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  firstName,
                  lastName,
                  emailField,
                  passField,
                  downListGender,
                  btnRegister
                ]),
          ),
        ));
  }
}
