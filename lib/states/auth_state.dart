import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "../http_func.dart";

class Friends {
  // i know how to name variables
  final List<String> user;
  final List<String> requests;
  final List<String> sentRequests;

  Friends(this.user, this.requests, this.sentRequests);
}

class UserInfo {
  final String username;
  final String email;
  final String id;
  final String descrim;
  final String avatar;

  final List<String> blockList;
  final Friends friends;

  UserInfo(this.username, this.email, this.id, this.descrim, this.avatar,
      this.blockList, this.friends);
}

class AuthInfo {
  String token;

  AuthInfo(this.token);
}

final authStateProvider = ChangeNotifierProvider<AuthState>((ref) {
  return AuthState();
});

class AuthState extends ChangeNotifier {
  late AuthInfo authInfo;
  late UserInfo userInfo;

  AuthState() {
    authInfo = AuthInfo("");
    userInfo = UserInfo("", "", "", "", "", [], Friends([], [], []));
    checkLogin();
  }

  Future<bool> checkLogin() async {
    if (authInfo.token == "") return false;
    return true;
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
          authInfo.token = body['token'];
          return true;
        }

      default:
        return false;
    }
  }
}
