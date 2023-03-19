import 'package:flutter/material.dart';

import '../constants/global.dart';

class InputBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool secret;

  const InputBox({
    super.key,
    required this.controller,
    required this.hintText,
    this.secret = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secret,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Global.white,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
      validator: (value) {
        if(value==null || value.isEmpty){
          return 'Enter your $hintText';
        }
        return null;
      },
    );
  }
}