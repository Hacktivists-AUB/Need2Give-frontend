import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/screens/user/search.dart';
import 'package:need2give/widgets/textfield.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final List<Map<String, dynamic>> _categories = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        title: const Text("Explore"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: SearchBar(
                    searchMode: SearchMode.all,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/map");
                  },
                  icon: const Icon(
                    Icons.location_on_sharp,
                    size: 36,
                    color: Global.darkGreen,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              height: 48.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _categories
                    .map(
                      (e) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Global.lightGreen,
                        ),
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            e["name"],
                            style: const TextStyle(color: Global.white),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
