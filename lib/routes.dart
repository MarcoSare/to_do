import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:to_do/screens/login_screen.dart';
import 'package:to_do/screens/regsiter.screen.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    "/login": (BuildContext context) => LoginScreen(),
    "/register": (BuildContext context) => RegisterScreen(),
  };
}
