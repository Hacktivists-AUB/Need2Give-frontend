import 'package:flutter/material.dart';
import 'package:need2give/screens/auth/login.dart';
import 'package:need2give/screens/auth/signup.dart';
import 'package:need2give/screens/auth/welcome.dart';
import 'package:need2give/screens/main_pages_navbar/ButtonNavbar.dart';

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
    case SignUp.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const SignUp(),
      );
    case ButtonNavbar.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const ButtonNavbar(),
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
