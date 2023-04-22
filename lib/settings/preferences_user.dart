import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/models/user_model.dart';

class PreferencesUser {
  Future<void> setLogin(UserModel userModel) async {
    await setId(userModel.id!);
    await setFirstName(userModel.firstName!);
    await setLastName(userModel.lastName!);
    await setEmail(userModel.email!);
    await setProfilePicture(userModel.profilePicture!);
    await setIsAdmin(userModel.isAdmin!);
    await setToken(userModel.token!);
  }

  Future<UserModel> getUser() async {
    int? id = await getId();
    String? firstName = await getFirstName();
    String? lastName = await getLastName();
    String? email = await getEmail();
    String? profilePicture = await getProfilePicture();
    bool? isAdmin = await getIsAdmin();
    String? token = await getToken();
    return UserModel(
        id: id!,
        firstName: firstName!,
        lastName: lastName,
        email: email!,
        profilePicture: profilePicture!,
        isAdmin: isAdmin!,
        token: token!);
  }

  Future<void> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("id");
    await preferences.remove("firstName");
    await preferences.remove("lastName");
    await preferences.remove("email");
    await preferences.remove("profilePicture");
    await preferences.remove("isAdmin");
    await preferences.remove("token");
  }

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

  Future<void> setIsAdmin(bool isAdmin) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool("isAdmin", isAdmin);
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

  Future<bool?> getIsAdmin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("isAdmin")) {
      return preferences.getBool("isAdmin");
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
