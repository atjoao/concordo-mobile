import 'package:concordo/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final String error;

  const LoginPage({super.key, required this.error});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String _error = "";
  bool _loading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final authState = Provider.of<AuthState>(context, listen: false);
    authState.addListener(() {
      if (authState.authInfo.token != "") {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _changeError(String? error) {
    setState(() {
      _error = error ?? "";
    });
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
            Text(_error),
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
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;

                  final authState = context.read<AuthState>();

                  try {
                    _loading = true;
                    final result = await authState.createAuth(email, password);
                    if (result['error'] == 'true') {
                      _changeError(result['message']);
                      _loading = false;
                    } else {
                      _loading = false;
                    }
                  } catch (e) {
                    _changeError(e.toString());
                    _loading = false;
                  }
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
                child: _loading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      )
                    : const Text("Entrar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
