import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:to_do/models/user_model.dart';
import 'package:to_do/network/api_user.dart';
import 'package:to_do/provider/theme_provider.dart';
import 'package:to_do/responsive.dart';
import 'package:to_do/settings/preferences_system.dart';
import 'package:to_do/settings/preferences_user.dart';
import 'package:to_do/widgets/dialog_widget.dart';
import 'package:to_do/widgets/email_field.dart';
import 'package:to_do/widgets/pass_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PreferencesSytem preferencesSytem = PreferencesSytem();
  bool toogleTheme = false;
  bool loginFailed = false;
  ApiUser apiUser = ApiUser();
  PreferencesUser preferencesUser = PreferencesUser();
  EmailField emailField = EmailField(
      label: "Email", hint: "Email", msgError: "Email or password wrong");
  PassField passField = PassField(
      label: "Password", hint: "Password", msgError: "Email or password wrong");

  bool isShow = false;

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

  bool validateForm() {
    if (loginFailed) {
      if (emailField.msgError == "Email or password wrong" &&
          !emailField.formkey.currentState!.validate()) {
        return true;
      } else if (passField.msgError == "Email or password wrong" &&
          !passField.formkey.currentState!.validate()) {
        return true;
      }
    }
    if (emailField.formkey.currentState!.validate()) {
      if (passField.formkey.currentState!.validate()) {
        return true;
      }
    }
    return false;
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    DialogWidget dialogWidget = DialogWidget(context: context);

    Future<void> login() async {
      final userModel = UserModel(
          email: emailField.controlador, password: passField.controlador);
      dialogWidget.showProgress();
      var response = await apiUser.login(userModel);
      dialogWidget.closeProgress();
      if (!response.containsKey("Error")) {
        var data = response["data"];
        final userModelLogin = UserModel.fromMap(data);
        await preferencesUser.setLogin(userModelLogin);
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
      } else {
        loginFailed = true;
        if (response["Error"] == "Login failed") {
          emailField.error = true;
          emailField.formkey.currentState!.validate();
          passField.error = true;
          passField.formkey.currentState!.validate();
        } else if (response["Error"] == "Tiempo de espera agotado") {
          dialogWidget.showErrorDialog("Tiempo de espera agotado",
              "Verifica tu conexión e intenta más tarde");
        } else {
          dialogWidget.showErrorDialog(
              "Error inesperado", "Verifica tu conexión e intenta más tarde");
        }
      }
    }

    final btnLogin = Padding(
      padding: const EdgeInsets.all(8.0),
      child: SocialLoginButton(
        buttonType: SocialLoginButtonType.generalLogin,
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          if (validateForm()) {
            login();
          }
        },
        borderRadius: 15,
      ),
    );

    Widget formLogin = getFormLogin(themeProvider, btnLogin);

    return Scaffold(
        body: Responsive(
      desktop: desktopScreen(formLogin),
      mobile: formLogin,
    ));
  }

  Widget getFormLogin(ThemeProvider themeProvider, Widget btnLogin) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -90,
            left: -90,
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
            top: -90,
            right: -90,
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
                    Row(
                      children: [
                        const Text(
                          "Login to your account",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Switch.adaptive(
                            value: themeProvider.isDarkMode,
                            onChanged: (bool value) async {
                              await preferencesSytem.setTheme(value);
                              final provider = Provider.of<ThemeProvider>(
                                  context,
                                  listen: false);
                              provider.toggleTheme(value);
                            })
                      ],
                    ),
                    emailField,
                    passField,
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
                          style: TextStyle(fontSize: 16),
                        ),
                        Expanded(
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/register");
                              },
                              child: const Text("Create your account",
                                  style: TextStyle(fontSize: 16))),
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forget your password?",
                        )),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget desktopScreen(Widget formLogin) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                "https://cdn2.hubspot.net/hubfs/5796582/4-smart-working.jpg",
                fit: BoxFit.cover,
              ),
            )),
        Expanded(flex: 1, child: formLogin),
      ],
    );
  }
}
