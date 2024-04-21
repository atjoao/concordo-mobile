import 'package:concordo/pages/auth/auth_page.dart';
import 'package:concordo/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool authenticated = false;

  @override
  void initState() {
    super.initState();

    final authState = Provider.of<AuthState>(context, listen: false);
    authState.addListener(() {
      if (authState.authInfo.token != "") {
        setState(() {
          authenticated = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: authenticated
          ? const Text("Homeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
          : const AuthPage(),
    );
  }
}
