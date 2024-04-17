import 'dart:convert';

import 'package:flutter/material.dart';
import "../http_func.dart";

class Friends {
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

  Future<void> createAuth(String email, String password) async {
    var http = HttpFunc();

    final response = http.createRequest(
        "/auth/login",
        "post",
        {"Content-Type": "application/json"},
        jsonEncode({"email": email, "password": password}));
  }
}
