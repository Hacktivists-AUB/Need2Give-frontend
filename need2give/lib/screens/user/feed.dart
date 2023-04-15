import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/widgets/post.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
    {
      "id": 1,
      "name": "All",
    },
    {
      "id": 2,
      "name": "Food",
    },
    {
      "id": 3,
      "name": "Medicine",
    },
    {
      "id": 4,
      "name": "Clothing",
    },
    {
      "id": 5,
      "name": "Electronics",
    },
    {
      "id": 6,
      "name": "Other",
    }
  ];
    return SafeArea(
      child: Scaffold(
          backgroundColor: Global.backgroundColor,
          appBar: AppBar(
            title: const Text("Profile"),
            centerTitle: true,
          ),
          body: ListView(children: const [
            PostComponent(
              title: 'Donation center name',
              body: 'has just added this cool item to its inventory',
              imageUrl: 'assets/cart.png',
              date: "8/9/2003",
            ),
            PostComponent(
              title: 'Donation center name',
              body: 'has just added this cool item to its inventory',
              imageUrl: 'assets/cart.png',
              date: "19/9/2003",
            ),
          ])),
    );
  }
}
