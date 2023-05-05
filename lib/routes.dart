import 'package:flutter/material.dart';
import 'package:to_do/screens/edit_user_screen.dart';
import 'package:to_do/screens/home_screen.dart';
import 'package:to_do/screens/login_screen.dart';
import 'package:to_do/screens/regsiter.screen.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    "/login": (BuildContext context) => const LoginScreen(),
    "/register": (BuildContext context) => const RegisterScreen(),
    "/home": (BuildContext context) => const HomeScreen(),
    "/editUser": (BuildContext context) => const EditUserScreen(),
  };
}
