import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:need2give/screens/user/search.dart';

import '../constants/global.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool secret;
  final bool required;
  final int? numberOfLines;

  const Input({
    super.key,
    required this.controller,
    required this.hintText,
    this.secret = false,
    this.required = true,
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
        if (widget.required && (value == null || value.isEmpty)) {
          return 'Enter your ${widget.hintText}';
        }
        return null;
      },
    );
  }
}

class PhoneInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool required;
  const PhoneInput({
    super.key,
    required this.controller,
    this.required = false,
    this.hintText = "Phone number",
  });

  @override
  State<PhoneInput> createState() => PhoneInputState();
}

class PhoneInputState extends State<PhoneInput> {
  String? number;
  PhoneNumber initialNumber = PhoneNumber(isoCode: 'LB');

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber value) {
        setState(() {
          number = value.phoneNumber;
        });
      },
      validator: (value) {
        if (widget.required && (value == null || value.isEmpty)) {
          return 'Enter your ${widget.hintText}';
        }
        return null;
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: initialNumber,
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
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 14),
      ),
      searchBoxDecoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Search',
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String text;
  const Label({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Global.mediumGrey,
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final SearchMode searchMode;
  const SearchBar({
    super.key,
    required this.searchMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Global.white,
        hintText: "Search",
        hintStyle: const TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(Icons.search),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          Search.routeName,
          arguments: {'searchMode': searchMode},
        );
      },
    );
  }
}
