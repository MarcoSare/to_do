import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/theme_provider.dart';
import 'package:to_do/routes.dart';
import 'package:to_do/screens/edit_user_screen.dart';
import 'package:to_do/screens/home_screen.dart';
import 'package:to_do/screens/login_screen.dart';
import 'package:to_do/screens/regsiter.screen.dart';
import 'package:to_do/settings/preferences_system.dart';
import 'package:to_do/settings/preferences_user.dart';
import 'package:to_do/settings/styles_settings.dart';

import 'screens/on_boarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  late Widget home;
  bool? theme;

  Widget getHome(int? id, bool? isBoarding) {
    if (isBoarding == null) {
      return const OnBoardingScreen();
    } else {
      if (!isBoarding) {
        return const OnBoardingScreen();
      } else {
        if (id == null) {
          return const LoginScreen();
        } else {
          return const EditUserScreen(); //HomeScreen();
        }
      }
    }
  }

  initData() async {
    PreferencesUser preferencesUser = PreferencesUser();
    PreferencesSytem preferencesSytem = PreferencesSytem();
    int? id = await preferencesUser.getId();
    bool? isBoarding = await preferencesSytem.getBoarding();
    theme = await preferencesSytem.getTheme();
    home = getHome(id, isBoarding);
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
                return ChangeNotifierProvider(
                    create: (context) => ThemeProvider()..init(theme),
                    builder: (context, child) {
                      final themeProvider = Provider.of<ThemeProvider>(context);
                      return MaterialApp(
                          debugShowCheckedModeBanner: false,
                          title: 'Flutter Demo',
                          routes: getAplicationRoutes(),
                          theme: MyThemes.lightTheme,
                          darkTheme: MyThemes.darkTheme,
                          themeMode: themeProvider.themeMode,
                          home: home);
                    });
              }
          }
        });
  }
}
/*
MaterialApp(
                    title: 'Flutter Demo',
                    routes: getAplicationRoutes(),
                    theme: MyThemes.lightTheme,
                    home: home);
                    */