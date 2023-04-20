import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/screens/auth/welcome.dart';
import 'package:need2give/router.dart';
import 'package:need2give/screens/main_pages_navbar/button_navbar.dart';
import 'package:need2give/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'constants/global.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
    ], 
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Need2Give',
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Global.green,
        ),
        colorScheme: const ColorScheme.light(
          primary: Global.green,
        ),
        scaffoldBackgroundColor: Global.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Global.white,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<AuthProvider>(context).profile.token.isEmpty
          ? const WelcomeScreen()
          : const ButtonNavbar(),
    );
  }
}
