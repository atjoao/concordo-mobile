import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:concordo/states/auth_state.dart';

class HomeAuth extends StatelessWidget {
  const HomeAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final authState = ref.watch(authStateProvider);

      return Scaffold(
        backgroundColor: const Color(0xFF848484),
        body: Flex(
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
                      child: const Text("Entrar no Concordo")),
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
        ),
      );
    });
  }
}
