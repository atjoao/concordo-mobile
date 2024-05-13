import 'dart:async';

import 'package:Concordo/states/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class VerifyForm {
  RegExp regExp = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$',
    caseSensitive: false,
    multiLine: false,
  );

  Future<void> formLoginProcess(BuildContext buildContext, String email,
      String password, void Function(bool) setLoading) async {
    final Tuple2<Future<bool>, Future<String>> formLoginResult =
        await formLogin(email, password);

    final String r = await formLoginResult.item2;
    final bool valido = await formLoginResult.item1;

    setLoading(true);

    if (buildContext.mounted) {
      if (valido) {
        final authState = Provider.of<AuthState>(buildContext, listen: false);
        final result = await authState.createAuth(email, password);
        if (result['error'] != 'true') {
          setLoading(false);
        } else {
          if (!buildContext.mounted) return;
          showDialog(
            context: buildContext,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Aviso"),
                content: Text(
                    result['message'] ?? "Não foi possível determinar o erro"),
                backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                surfaceTintColor: const Color.fromRGBO(217, 217, 217, 1),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setLoading(false);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(201, 68, 68, 1),
                    ),
                    child: const Text(
                      "Ok",
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ),
                ],
              );
            },
          );
        }
      } else {
        showDialog(
          context: buildContext,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Aviso"),
              content: Text(r),
              backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
              surfaceTintColor: const Color.fromRGBO(217, 217, 217, 1),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setLoading(false);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(201, 68, 68, 1),
                  ),
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

// lembra-te de que estas a fazer login e nao registo xd

  Future<Tuple2<Future<bool>, Future<String>>> formLogin(
      String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return Tuple2(
        Future.value(false),
        Future.value("Preencha todos os campos"),
      );
    }

    if (!regExp.hasMatch(email)) {
      return Tuple2(
        Future.value(false),
        Future.value("Este email não é válido"),
      );
    }

    if (password.length < 8 || password.length > 30) {
      return Tuple2(
        Future.value(false),
        Future.value(
            "Password tem de ter no minimo 8 caracters e no máximo 30"),
      );
    }

    return Tuple2(
      Future.value(true),
      Future.value(""),
    );
  }
}
