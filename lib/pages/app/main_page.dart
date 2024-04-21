import 'package:Concordo/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final authState = Provider.of<AuthState>(context, listen: false);
        authState.logout();
      },
      child: const Text("Main Page"),
    );
  }
}
