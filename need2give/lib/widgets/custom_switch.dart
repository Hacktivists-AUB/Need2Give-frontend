import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _isSwitched = false;
  void toggleSwitch(bool value) {
    setState(() {
      _isSwitched = !_isSwitched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform.scale(
          scale: 2,
          child: Switch(
            onChanged: toggleSwitch,
            value: _isSwitched,
            activeColor: Global.green,
            activeTrackColor: Global.green,
            inactiveThumbColor: Global.mediumGrey,
            inactiveTrackColor: Global.mediumGrey,
          ),
        ),
      ],
    );
  }
}
