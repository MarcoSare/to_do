import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:to_do/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:to_do/settings/preferences_user.dart';

class ApiUser {
  Future<Map<String, dynamic>> register(UserModel userModel) async {
    String url = "https://labmanufactura.net/marco/to-do-api/routes/user.php";
    Map data = {
      "first_name": userModel.firstName,
      "last_name": userModel.lastName,
      "email": userModel.email,
      "password": userModel.password,
      "gender": userModel.gender,
      "is_admin": 0
    };
    var body = json.encode(data);
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: body)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        var respError = json.decode(response.body);
        return {"Error": respError["message"], "code": respError["code"]};
      }
    } on TimeoutException catch (e) {
      return {"Error": "Tiempo de espera agotado"};
    } on Exception catch (e) {
      return {
        "Error": "Error inesperado",
      };
    }
  }

  Future<Map<String, dynamic>> login(UserModel userModel) async {
    String url = "https://labmanufactura.net/marco/to-do-api/routes/login.php";
    Map data = {
      "email": userModel.email,
      "password": userModel.password,
    };
    var body = json.encode(data);
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: body)
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        var respError = json.decode(response.body);
        return {"Error": respError["message"], "code": respError["code"]};
      }
    } on TimeoutException catch (e) {
      return {"Error": "Tiempo de espera agotado"};
    } on Exception catch (e) {
      return {
        "Error": "Error inesperado",
      };
    }
  }

  Future<Map<String, dynamic>> getUser() async {
    PreferencesUser preferencesUser = PreferencesUser();
    String? token = await preferencesUser.getToken();
    String url = "https://labmanufactura.net/marco/to-do-api/routes/user.php";
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader: token!,
        HttpHeaders.contentTypeHeader: "application/json"
      }).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        var respError = json.decode(response.body);
        return {"Error": respError["message"], "code": respError["code"]};
      }
    } on TimeoutException catch (e) {
      return {"Error": "Tiempo de espera agotado"};
    } on Exception catch (e) {
      return {
        "Error": "Error inesperado",
      };
    }
  }
}
