import 'package:Concordo/pages/app/main_page.dart';
import 'package:Concordo/pages/auth/auth_page.dart';
import 'package:Concordo/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool authenticated = false;

  late AuthState authState;

  @override
  void initState() {
    super.initState();

    authState = Provider.of<AuthState>(context, listen: false);
    authState.checkToken().then((value) {
      setState(() {
        authenticated = value;
      });
    });

    authState.addListener(() {
      setState(() {
        authenticated = authState.authInfo.token != "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: authenticated ? const MainPage() : const AuthPage(),
    );
  }
}
