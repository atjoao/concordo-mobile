import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Concordo/pages/auth/login_page.dart';
import 'package:Concordo/pages/auth/register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            SvgPicture.asset(
              "assets/svg/Concordo.svg",
              semanticsLabel: "Concordo Logo",
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                'Concordo',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 30.0,
                  fontFamily: "ComicNeue",
                ),
              ),
            )
          ],
        ),
        Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LoginPage(
                                error: "",
                              ))),
                    );
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
                  child: const Text("Entrar")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const RegisterPage())),
                  );
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
                child: const Text("Criar conta"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
