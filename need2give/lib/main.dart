import 'package:flutter/material.dart';
import 'package:need2give/auth_screens/welcome.dart';
import 'package:need2give/router.dart';
import 'constants/global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Need2Give',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Global.green,
        ),
        scaffoldBackgroundColor: Global.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const WelcomeScreen(),
    );
  }
}
