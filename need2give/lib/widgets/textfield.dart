import 'package:flutter/material.dart';

import '../constants/global.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool secret;

  const Input({
    super.key,
    required this.controller,
    required this.hintText,
    this.secret = false,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.secret? !_isVisible : false,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Global.white,
        suffixIcon: IconButton(
          icon: Icon(
            widget.secret ? (_isVisible? Icons.visibility : Icons.visibility_off) : null,
          ),
          onPressed: () {
              setState(() {
                _isVisible = !_isVisible;
              });
          },
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your $widget.hintText';
        }
        return null;
      },
    );
  }
}
