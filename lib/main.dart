import 'package:concordo/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// todo make decision abt stuff here
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color.fromARGB(255, 50, 50, 50),
        background: const Color(0xFF848484),
      )),
      home: const Home(),
    );
  }
}
