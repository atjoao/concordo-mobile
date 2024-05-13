import 'dart:async';
import 'dart:convert';

import 'package:Concordo/models/user.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import "../http_func.dart";

class AuthInfo {
  String token;

  AuthInfo(this.token);
}

class AuthState extends ChangeNotifier {
  late AuthInfo authInfo;
  late UserInfo userInfo;

  AuthState() {
    authInfo = AuthInfo("");
    userInfo = UserInfo("", "", "", "", "", [], Friends([], [], []));
  }

  Future<void> updateToken(String newToken) async {
    authInfo.token = newToken;

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", newToken.toString());

    notifyListeners();
  }

  Future<void> logout() async {
    authInfo.token = "";

    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");

    notifyListeners();
  }

  Future<bool> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    print("token $token");
    if (token != null) {
      authInfo.token = token;
      return true;
    }
    return false;
  }

// i hate this type
  FutureOr<Map<String, String>> createAuth(
      String email, String password) async {
    var http = HttpFunc();

    final response = await http.createRequest(
        "auth/login",
        "post",
        {"Content-Type": "application/json"},
        json.encode({"email": email, "password": password}));

    final body = json.decode(response.body);

    switch (body['status']) {
      case "MISSING_PARAMS":
      case "INVALID_EMAIL":
      case "INVALID_PASSWORD":
      case "NOT_FOUND":
        {
          return {
            'error': 'true',
            'message': body["message"],
            'status': body['status'],
          };
        }

      case "COMPLETED":
        {
          updateToken(body['token']);
          return {
            'error': 'false',
          };
        }

      default:
        return {'error': 'true', 'message': 'Erro desconhecido'};
    }
  }
}
