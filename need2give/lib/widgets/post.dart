import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';

class PostComponent extends StatelessWidget {
  final String name;
  final String pfpUrl;
  final String body;
  final String imageUrl;
  final String date;

  const PostComponent({
    Key? key,
    required this.name,
    required this.pfpUrl,
    required this.body,
    required this.imageUrl,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Global.green,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        pfpUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              body,
            ),
          ),
          const SizedBox(height: 10),
          if (imageUrl.isNotEmpty)
            Image.asset(
              imageUrl,
              scale: 5,
              height: 150,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Posted on $date',
              style: const TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
