import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';

class BackButton extends StatefulWidget {
  const BackButton({super.key});

  @override
  State<BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends State<BackButton> {
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
