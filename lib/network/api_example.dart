import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiExample {
  dynamic getPokemons() {
    List<dynamic> ids = List.empty(growable: true);
    for (int i = 1; i < 150; i++) {
      ids.add(i);
    }
    return Future.wait<dynamic>(ids.map((id) => http
            .get(Uri.parse("https://pokeapi.co/api/v2/pokemon/${id}"))
            .then((value) {
          var response = json.decode(value.body);
          return response;
        })));
  }
}
