import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  final String title;
  final String body;
  final String imageUrl;
  final String date;

  const PostComponent({
    Key? key,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              body,
            ),
          ),
          const SizedBox(height: 10),
          if (imageUrl.isNotEmpty)
            Image.asset(imageUrl,scale: 5,height: 150,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
