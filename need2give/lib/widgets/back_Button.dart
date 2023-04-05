import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';

class backButton extends StatefulWidget {
  const backButton({super.key});

  @override
  ButtonBack createState() =>  ButtonBack();
}

class ButtonBack extends State {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Global.white),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
