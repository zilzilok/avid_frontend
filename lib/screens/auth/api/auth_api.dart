import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthApi {
  static const String BASE_URL = "avid-rest-api.herokuapp.com";

  static Future<String> attemptAuth(String username, String password) async {
    var res = await http.post(
      Uri.https(BASE_URL, "/auth"),
      headers: {
        "content-type": "application/json",
      },
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );
    if (res.statusCode == 200) {
      return res.body;
    }
    return null;
  }

  static Future<int> attemptRegister(String username, String email,
      String password, String matchingPassword) async {
    var res = await http.post(
      Uri.https(BASE_URL, "/registration"),
      headers: {
        "content-type": "application/json",
      },
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password,
        "matchingPassword": matchingPassword,
      }),
    );
    return res.statusCode;
  }

  static Future<bool> attempt(String jwt) async {
    var res = await http.get(
      Uri.https(BASE_URL, "/users"),
      headers: {
        "content-type": "application/json",
        "authorization": "Bearer $jwt",
      },
    );
    return res.statusCode == 200;
  }
}
