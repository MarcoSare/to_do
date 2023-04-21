import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {
  Future<void> setId(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt("id", id);
  }

  Future<void> setFirstName(String firstName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("firstName", firstName);
  }

  Future<void> setLastName(String lastName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("lastName", lastName);
  }

  Future<void> setEmail(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("email", email);
  }

  Future<void> setProfilePicture(String profilePicture) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("profilePicture", profilePicture);
  }

  Future<void> setIsAdmin(int isAdmin) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt("isAdmin", isAdmin);
  }

  Future<void> setToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("token", token);
  }

  Future<int?> getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("id")) {
      return preferences.getInt("id");
    } else {
      return null;
    }
  }

  Future<String?> getFirstName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("firstName")) {
      return preferences.getString("firstName");
    } else {
      return null;
    }
  }

  Future<String?> getLastName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("lastName")) {
      return preferences.getString("lastName");
    } else {
      return null;
    }
  }

  Future<String?> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("email")) {
      return preferences.getString("email");
    } else {
      return null;
    }
  }

  Future<String?> getProfilePicture() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("profilePicture")) {
      return preferences.getString("profilePicture");
    } else {
      return null;
    }
  }

  Future<int?> getisAdmin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("isAdmin")) {
      return preferences.getInt("isAdmin");
    } else {
      return null;
    }
  }

  Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("token")) {
      return preferences.getString("token");
    } else {
      return null;
    }
  }
}
