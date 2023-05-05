import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:to_do/models/user_model.dart';
import 'package:to_do/network/api_user.dart';
import 'package:to_do/provider/theme_provider.dart';
import 'package:to_do/responsive.dart';
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
  DownListGender downListGender = DownListGender(
    control: "male",
  );

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
        gender: downListGender.control,
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
        body: Responsive(
      mobile: getFormRegister(btnRegister, false),
      desktop: desktopScreen(getFormRegister(btnRegister, false)),
      tablet: getFormRegister(btnRegister, true),
    ));
  }

  Widget getFormRegister(Widget btnRegister, bool isTablet) {
    return Container(
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
            padding: EdgeInsets.all(isTablet ? 100 : 25),
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
    );
  }

  Widget desktopScreen(Widget formRegister) {
    return Row(
      children: [
        Expanded(flex: 1, child: formRegister),
        Expanded(
            flex: 2,
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: -90,
                      left: -90,
                      child: Transform.rotate(
                        angle: 180,
                        child: Image.asset(
                          "assets/images/graph.png",
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -90,
                      right: -100,
                      child: Transform.rotate(
                        angle: 90,
                        child: Image.asset(
                          "assets/images/graph.png",
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 50,
                      right: 50,
                      child: Image.asset(
                        "assets/images/graph.png",
                        height: 500,
                        width: 500,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/img_login.png",
                            height: 400,
                            width: 500,
                            fit: BoxFit.cover,
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 100, right: 100, top: 15),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "About us",
                                      style: TextStyle(fontSize: 18),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("FAQ's",
                                        style: TextStyle(fontSize: 18))),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ))),
      ],
    );
  }
}
