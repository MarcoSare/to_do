import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:to_do/models/user_model.dart';
import 'package:to_do/network/api_user.dart';
import 'package:to_do/provider/theme_provider.dart';
import 'package:to_do/widgets/dialog_widget.dart';
import 'package:to_do/widgets/down_list_gender.dart';
import 'package:to_do/widgets/email_field.dart';
import 'package:to_do/widgets/pass_field.dart';
import 'package:to_do/widgets/text_field.dart';

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

    final btnRegister = Padding(
      padding: const EdgeInsets.all(8.0),
      child: SocialLoginButton(
        buttonType: SocialLoginButtonType.generalLogin,
        backgroundColor: Theme.of(context).colorScheme.primary,
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
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -90,
            right: -90,
            child: Transform.rotate(
              angle: 270,
              child: Image.asset(
                "assets/images/graph.png",
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: -90,
            left: -90,
            child: Transform.rotate(
              angle: 100,
              child: Image.asset(
                "assets/images/graph.png",
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        Provider.of<ThemeProvider>(context).themeMode ==
                                ThemeMode.dark
                            ? "assets/images/logo_dark.png"
                            : "assets/images/logo.png",
                        height: 100,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text("Create your account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    firstName,
                    lastName,
                    emailField,
                    passField,
                    downListGender,
                    btnRegister
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}
