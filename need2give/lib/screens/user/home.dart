import 'package:flutter/material.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).profile;
    return Scaffold(
      body: Center(
        child: Text(user!.toJson()),
      ),
    );
  }
}
