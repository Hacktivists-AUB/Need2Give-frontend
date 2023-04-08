import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  static const String routeName = "/category";
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(category["name"]),
        centerTitle: true,
      ),
      body: Center(
        child: Text("category ${category["id"]}"),
      ),
    );
  }
}
