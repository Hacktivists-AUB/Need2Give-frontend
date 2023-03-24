import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../constants/global.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool secret;
  final int? numberOfLines;

  const Input({
    super.key,
    required this.controller,
    required this.hintText,
    this.secret = false,
    this.numberOfLines = 1,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.secret ? !_isVisible : false,
      controller: widget.controller,
      maxLines: widget.numberOfLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Global.white,
        suffixIcon: IconButton(
          icon: Icon(
            widget.secret
                ? (_isVisible ? Icons.visibility : Icons.visibility_off)
                : null,
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
          return 'Enter your ${widget.hintText}';
        }
        return null;
      },
    );
  }
}

class PhoneInput extends StatefulWidget {
  final TextEditingController controller;

  const PhoneInput({
    super.key,
    required this.controller,
  });

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  String initialCountry = 'LB';
  PhoneNumber number = PhoneNumber(isoCode: 'LB');
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {},
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: number,
      textFieldController: widget.controller,
      formatInput: true,
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      inputDecoration: InputDecoration(
        filled: true,
        fillColor: Global.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Phone number',
        hintStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}
