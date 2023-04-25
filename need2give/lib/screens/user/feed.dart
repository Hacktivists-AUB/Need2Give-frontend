import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/widgets/post.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {
        "name": "Donation center 1",
        "body": "has just added this cool item to its inventory",
        "imageUrl": "assets/cart.png",
        "pfpUrl": "assets/donation_center.png",
        "date": "15/04/2023"
      },
      {
        "name": "Donation center 2",
        "body": "has just added this cool item to its inventory",
        "imageUrl": "assets/cart.png",
        "pfpUrl": "assets/donation_center.png",
        "date": "14/04/2023"
      },
      {
        "name": "Donation center 3",
        "body": "has just added this cool item to its inventory",
        "imageUrl": "assets/cart.png",
        "pfpUrl": "assets/donation_center.png",
        "date": "13/04/2023"
      },
      {
        "name": "Donation center 4",
        "body": "has just added this cool item to its inventory",
        "imageUrl": "assets/cart.png",
        "pfpUrl": "assets/donation_center.png",
        "date": "12/04/2023"
      },
      {
        "name": "Donation center 5",
        "body": "has just added this cool item to its inventory",
        "imageUrl": "assets/cart.png",
        "pfpUrl": "assets/donation_center.png",
        "date": "11/04/2023"
      },
      {
        "name": "Donation center 6",
        "body": "has just added this cool item to its inventory",
        "imageUrl": "assets/cart.png",
        "pfpUrl": "assets/donation_center.png",
        "date": "10/04/2023"
      },
      {
        "name": "Donation center 7",
        "body": "has just added this cool item to its inventory",
        "imageUrl": "assets/cart.png",
        "pfpUrl": "assets/donation_center.png",
        "date": "09/04/2023"
      },
      {
        "name": "Donation center 8",
        "body": "has just added this cool item to its inventory",
        "imageUrl": "assets/cart.png",
        "pfpUrl": "assets/donation_center.png",
        "date": "08/04/2023"
      },
      {
        "name": "Donation center 9",
        "body": "has just added this cool item to its inventory",
        "imageUrl": "assets/cart.png",
        "pfpUrl": "assets/donation_center.png",
        "date": "07/04/2023"
      },
      {
        "name": "Donation center 10",
        "body": "has just added this cool item to its inventory",
        "imageUrl": "assets/cart.png",
        "pfpUrl": "assets/donation_center.png",
        "date": "06/04/2023"
      }
    ];

    return SafeArea(
      child: Scaffold(
          backgroundColor: Global.backgroundColor,
          appBar: AppBar(
            title: const Text("Feed"),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  final post = posts[index];
                  return PostComponent(
                    pageRoute: MaterialPageRoute(
                      builder: (context) => const Text("hi"),
                    ),
                    name: post["name"],
                    pfpUrl: post["pfpUrl"],
                    body: post["body"],
                    imageUrl: post["imageUrl"],
                    date: post["date"],
                  );
                },
              ),
            ],
          )),
    );
  }
}
