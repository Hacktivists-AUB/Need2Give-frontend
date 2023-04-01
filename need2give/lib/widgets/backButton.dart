import 'package:flutter/material.dart';

class backButton extends StatefulWidget {
  @override
  ButtonBack createState() => new ButtonBack();
}

class ButtonBack extends State {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
