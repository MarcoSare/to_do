import 'package:shared_preferences/shared_preferences.dart';

class PreferencesSytem {
  Future<void> setTheme(bool theme) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool("theme", theme);
  }

  Future<void> setBoarding(bool flag) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool("boarding", flag);
  }

  Future<bool?> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("theme")) {
      return preferences.getBool("theme");
    } else {
      return null;
    }
  }

  Future<bool?> getBoarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("boarding")) {
      return preferences.getBool("boarding");
    } else {
      return null;
    }
  }
}
