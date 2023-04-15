import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUs();
}

class _AboutUs extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Row(
            children: const [
              Icon(Icons.timer),
              Text("Opening hours : 8am - 5pm"),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Colors.blueGrey,
          ),
        ),
        Row(
          children: const [
            Icon(Icons.location_city),
            Text("Location : Beirut"),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Colors.blueGrey,
          ),
        ),
        Container(
          width: 394,
          margin: const EdgeInsets.only(top: 12),
          child: const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum vulputate nisi aenean risus, nulla ultrices feugiat facilisi ut. In nunc tincidunt dolor placerat suscipit. Risus justo elementum at in malesuada fringilla lacus pellentesque.",
            maxLines: null,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
