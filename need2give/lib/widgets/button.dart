import 'package:need2give/constants/global.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Global.green,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

class CustomCheckbox extends StatefulWidget {
  final String label;
  final Function(bool?) onChanged;
  const CustomCheckbox({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 14),
        ),
        Checkbox(
          activeColor: Global.darkGreen,
          checkColor: Global.white,
          value: _checked,
          onChanged: (bool? val) {
            widget.onChanged(val);
            setState(() {
              _checked = !_checked;
            });
          },
        ),
      ],
    );
  }
}

class IconTextButton extends StatelessWidget {
  final String label;
  final IconData icon;
  const IconTextButton({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Icon(
            icon,
            color: Global.mediumGrey,
            size: 32,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Global.darkGreen,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
