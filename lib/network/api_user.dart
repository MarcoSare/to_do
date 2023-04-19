import 'dart:convert';

import 'package:to_do/models/user_model.dart';
import 'package:http/http.dart' as http;

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
    http.Response response = await http.post(Uri.parse(url), body: body);
    return json.decode(response.body);
  }
}
