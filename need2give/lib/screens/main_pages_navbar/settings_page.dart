import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/screens/common/edit_Profile.dart';
import 'package:need2give/screens/common/change_Password.dart';
import 'package:need2give/screens/common/contact_Us.dart';
import 'package:need2give/screens/common/forget_Password.dart';
import 'package:need2give/screens/common/notification_Settings.dart';
import 'package:need2give/screens/common/terms.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Global.backgroundColor,
        appBar: AppBar(
          title: const Text("Settings"),
          centerTitle: true,
        ),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person,
                      size: 24.0,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 2, 0, 0),
                      child: Text(
                        "Edit Profile",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 29),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const NotificationSettingsScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.notifications,
                        size: 24.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 1, 0, 0),
                        child: Text(
                          "Notifications",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 27, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePassword(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.lock_reset,
                        size: 24.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 2, 0, 0),
                        child: Text(
                          "Change password",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 28, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPassword(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.light_mode,
                        size: 24.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 1, 0, 0),
                        child: Text(
                          "Theme",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 27, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Terms(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.description,
                        size: 24.0,
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(8, 2, 0, 0),
                          child: Text(
                            "Terms and Conditions",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          )),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 27, 0, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactUs(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.email,
                        size: 24.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 2, 0, 0),
                        child: Text(
                          "Contact us and Feedback",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapArrowleft2(BuildContext context) {
    Navigator.pop(context);
  }
}
