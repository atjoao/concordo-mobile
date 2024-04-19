import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Entrar no concordo"),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Palavra-passe",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        foregroundColor:
                            MaterialStatePropertyAll<Color>(Colors.black),
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Color.fromRGBO(200, 195, 195, 1)),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              side: BorderSide(color: Colors.black)),
                        ),
                      ),
                      child: const Text("Iniciar Sessão")),
                )
              ],
            )
          ],
        ));
  }
}
