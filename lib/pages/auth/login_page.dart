import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar no concordo"),
      ),
      body: Form(
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: "Palavra-passe",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: ElevatedButton(
                  onPressed: () {
                    debugPrint("Login -> ${_emailController.text}");
                  },
                  style: const ButtonStyle(
                    foregroundColor:
                        MaterialStatePropertyAll<Color>(Colors.black),
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromRGBO(200, 195, 195, 1)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          side: BorderSide(color: Colors.black)),
                    ),
                  ),
                  child: const Text("Iniciar Sessão")),
            )
          ],
        ),
      ),
    );
  }
}
