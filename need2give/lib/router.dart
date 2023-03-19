import 'package:flutter/material.dart';
import 'package:need2give/auth_screens/login.dart';
import 'package:need2give/auth_screens/welcome.dart';

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
