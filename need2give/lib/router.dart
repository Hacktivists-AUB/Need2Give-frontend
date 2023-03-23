import 'package:flutter/material.dart';
import 'package:need2give/screens/auth/login.dart';
import 'package:need2give/screens/auth/welcome.dart';
import 'package:need2give/screens/home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case WelcomeScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const WelcomeScreen(),
      );
    case Login.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Login(),
      );
    case Home.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Home(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('page doesnt exist'),
          ),
        ),
      );
  }
}
