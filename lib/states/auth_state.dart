import 'dart:convert';

import 'package:concordo/models/user.dart';
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
    checkLogin();
  }

  bool checkLogin() {
    if (authInfo.token == "") return false;
    return true;
  }

  Future<void> updateToken(String newToken) async {
    authInfo.token = newToken;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", newToken);

    notifyListeners();
  }

  Future<dynamic> createAuth(String email, String password) async {
    var http = HttpFunc();

    final response = await http.createRequest(
        "/auth/login",
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
          var data = {
            'message': body["message"],
            'status': body['status'],
          };
          return data;
        }

      case "COMPLETED":
        {
          updateToken(body['token']);
          return true;
        }

      default:
        return false;
    }
  }
}
