import 'package:flutter/material.dart';
import 'package:need2give/screens/auth/login.dart';
import 'package:need2give/screens/auth/signup.dart';
import 'package:need2give/screens/auth/welcome.dart';
import 'package:need2give/screens/user/home.dart';
import 'package:need2give/screens/user/search.dart';
import 'package:need2give/screens/user/map.dart';
import 'package:need2give/screens/user/category.dart';
import 'package:need2give/screens/main_pages_navbar/button_navbar.dart';

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
    case Home.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Home(),
      );
    case Search.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Search(),
      );
    case MapScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const MapScreen(),
      );
    case ButtonNavbar.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const ButtonNavbar(),
      );
    case Category.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Category(),
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
