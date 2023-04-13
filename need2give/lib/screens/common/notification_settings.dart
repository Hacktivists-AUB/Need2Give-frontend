import 'package:flutter/material.dart';
import 'package:need2give/widgets/custom_switch.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text("Notifications"),
          centerTitle: true,
        ),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 1),
                    child: Text(
                      "General Notification",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomSwitch(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1),
                      child: Text(
                        "Sound",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    CustomSwitch(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1),
                      child: Text(
                        "Vibrate",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    CustomSwitch(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        "App Updates",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    CustomSwitch(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 1),
                      child: Text(
                        "New Service Available",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    CustomSwitch(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 31, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        "New tips available",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    CustomSwitch(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onTapArrowleft21(BuildContext context) {
    Navigator.pop(context);
  }
}
