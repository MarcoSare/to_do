import 'package:shared_preferences/shared_preferences.dart';

class PreferencesSytem {
  Future<void> setTheme(bool theme) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool("theme", theme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("theme")) {
      return preferences.getBool("theme");
    } else {
      return null;
    }
  }
}
