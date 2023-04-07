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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
