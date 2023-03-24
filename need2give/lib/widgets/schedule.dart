import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:need2give/widgets/button.dart';

class WeekdayPicker extends StatefulWidget {
  const WeekdayPicker({super.key});

  @override
  State<WeekdayPicker> createState() => _WeekdayPickerState();
}

class _WeekdayPickerState extends State<WeekdayPicker> {
  final List<String> _checkboxLabels = [
    "MON",
    "TUE",
    "WED",
    "THR",
    "FRI",
    "SAT",
    "SUN"
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _checkboxLabels.map((String s) {
        return CustomCheckbox(label: s);
      }).toList(),
    );
  }
}

class TimePicker extends StatefulWidget {
  final String label;
  const TimePicker({
    super.key,
    required this.label,
  });

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16),
        ),
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextFormField(
              controller: _timeController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                hintText: "12",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(":", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextFormField(
              controller: _minuteController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                hintText: "00",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
