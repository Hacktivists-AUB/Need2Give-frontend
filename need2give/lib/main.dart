import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:need2give/provider/user_provider.dart';
import 'package:need2give/screens/auth/welcome.dart';
import 'package:need2give/router.dart';
import 'package:need2give/screens/main_pages_navbar/button_Navbar.dart';
import 'package:need2give/widgets/button.dart';
import 'package:provider/provider.dart';
import 'constants/global.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
    ],
    child: const MyApp(),
  ));
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
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 20),
          bodyMedium: TextStyle(fontSize: 20)
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
      home:  ButtonNavbar(),
    );
  }
}
