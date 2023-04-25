import 'package:flutter/material.dart';
import 'package:to_do/routes.dart';
import 'package:to_do/screens/home_screen.dart';
import 'package:to_do/screens/login_screen.dart';
import 'package:to_do/settings/preferences_user.dart';
import 'package:to_do/settings/styles_settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  late Widget home;

  Widget getHome(int? id) {
    if (id == null) {
      return const LoginScreen();
    } else {
      return const HomeScreen();
    }
  }

  initData() async {
    PreferencesUser preferencesUser = PreferencesUser();
    int? id = await preferencesUser.getId();
    home = getHome(id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            case ConnectionState.done:
              {
                return MaterialApp(
                    title: 'Flutter Demo',
                    routes: getAplicationRoutes(),
                    theme: MyThemes.lightTheme,
                    home: home);
              }
          }
        });
  }
}
