import 'package:Concordo/pages/auth/components/login_comp.dart';
import 'package:Concordo/pages/auth/components/register_comp.dart';
import 'package:Concordo/pages/auth/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class AuthPage extends StatefulWidget {
  final AuthForm authForm = AuthForm.login;

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {
  late AuthForm _currentForm;

  @override
  void initState() {
    super.initState();
    _currentForm = widget.authForm;
  }

  void _changeForm(AuthForm newForm) {
    setState(() {
      _currentForm = newForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/Concordo.svg",
                semanticsLabel: "Concordo Logo",
              ),
              const Text(
                'Concordo',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 30.0,
                  fontFamily: "ComicNeue",
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(0, 0, 0, 1),
                width: 2.0,
              ),
              color: const Color.fromRGBO(165, 165, 165, 1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: _currentForm == AuthForm.login
                ? LoginComp(changeForm: _changeForm)
                : RegisterComp(changeForm: _changeForm),
          ),
        )
      ],
    );
  }
}
