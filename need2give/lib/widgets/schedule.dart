import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:need2give/widgets/button.dart";

class Schedule extends StatefulWidget {
  final Function(Map<String, dynamic>) onConfirm;
  const Schedule({super.key, required this.onConfirm});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final Map<String, dynamic> _selectedHours = {
    "opening_time": "12:00",
    "closing_time": "12:00",
  };

  final Map<String, bool?> _weekdays = {
    "monday": false,
    "tuesday": false,
    "wednesday": false,
    "thursday": false,
    "friday": false,
    "saturday": false,
    "sunday": false,
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Select opening hours",
        style: TextStyle(fontSize: 18),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 90.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _weekdays.length,
              itemBuilder: (BuildContext context, int index) {
                String key = _weekdays.keys.elementAt(index);
                return CustomCheckbox(
                  label: key.substring(0, 3).toUpperCase(),
                  onChanged: (bool? value) {
                    setState(() {
                      _weekdays[key] = value;
                    });
                  },
                );
              },
            ),
          ),
          TimePicker(
            label: "Open: ",
            onTimeChanged: (text) {
              setState(() {
                _selectedHours["opening_time"] = text;
              });
            },
          ),
          const SizedBox(height: 16),
          TimePicker(
            label: "Close: ",
            onTimeChanged: (text) {
              setState(() {
                _selectedHours["closing_time"] = text;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text("Confirm"),
          onPressed: () {
            widget.onConfirm({
              ..._selectedHours,
              "opening_days": _weekdays,
            });
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}

class TimePicker extends StatefulWidget {
  final String label;
  final Function(String) onTimeChanged;
  const TimePicker({
    super.key,
    required this.label,
    required this.onTimeChanged,
  });

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();

  String _timeString = "12:00";

  @override
  void dispose() {
    _minuteController.dispose();
    _hourController.dispose();
    super.dispose();
  }

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
            child: TextFormField(
              controller: _hourController,
              onChanged: (text) {
                setState(() {
                  _timeString =
                      "${_hourController.text}:${_minuteController.text}";
                });
                widget.onTimeChanged(_timeString);
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
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
          child: Text(
            ":",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: TextFormField(
              controller: _minuteController,
              onChanged: (text) {
                setState(() {
                  _timeString =
                      "${_hourController.text}:${_minuteController.text}";
                });
                widget.onTimeChanged(_timeString);
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
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
