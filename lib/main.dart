import 'package:flutter/material.dart';
import 'package:restaurant/pages/login.dart';
import 'package:restaurant/pages/menu_page.dart';
import 'package:restaurant/pages/register.dart';
import 'package:restaurant/pages/update.dart';
import 'package:restaurant/pages/view.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/registerpage': (context) => RegisterPage(),
        '/view': (context) => ViewPage(),
        '/login': (context) => login(),
      },
    );
  }
}

