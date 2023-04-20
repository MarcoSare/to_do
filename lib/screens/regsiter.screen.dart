import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:to_do/models/user_model.dart';
import 'package:to_do/network/api_user.dart';
import 'package:to_do/widgets/dialog_widget.dart';
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
  bool isLoading = false;
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

  @override
  Widget build(BuildContext context) {
    DialogWidget dialogWidget = DialogWidget(context: context);
    Future<void> registerUser() async {
      final userModel = UserModel(
        firstName: firstName.controlador,
        lastName: lastName.controlador,
        email: emailField.controlador,
        password: passField.controlador,
        gender: downListGender.control!,
      );
      dialogWidget.showProgress();
      var response = await apiUser.register(userModel);
      dialogWidget.closeProgress();

      if (!response.containsKey("Error")) {
        dialogWidget.showSuccesDialog(
            "Succesful register", "Se ha enviado un correo de confirmación");
      } else {
        if (response["Error"] == "This email has already been registered") {
          emailField.error = true;
          emailField.msgError = response["Error"];
          emailField.formkey.currentState!.validate();
        } else if (response["Error"] == "Tiempo de espera agotado") {
          dialogWidget.showErrorDialog("Tiempo de espera agotado",
              "Verifica tu conexión e intenta más tarde");
        } else {
          dialogWidget.showErrorDialog(
              "Error inesperado", "Verifica tu conexión e intenta más tarde");
        }
      }
    }

    Future<void> prueba() async {
      dialogWidget.showProgress();
      await Future.delayed(const Duration(milliseconds: 5000));
      dialogWidget.closeProgress();
      // ignore: use_build_context_synchronously
      dialogWidget.showSuccesDialog(
          "Succesful register", "Se ha enviado un correo de confirmación");
    }

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
            child: Stack(
              children: [
                AbsorbPointer(
                  absorbing: isLoading,
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
                isLoading
                    ? Positioned.fill(
                        child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(20),
                              color: Colors.grey,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    "Please wait",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  CircularProgressIndicator(
                                    backgroundColor: Colors.black45,
                                    color: Colors.purple,
                                  ),
                                ],
                              ),
                            )))
                    : const SizedBox(),
              ],
            ),
          ),
        ));
  }
}
