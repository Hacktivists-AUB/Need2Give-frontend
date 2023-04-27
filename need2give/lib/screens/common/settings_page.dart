import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/screens/auth/welcome.dart';
import 'package:need2give/screens/common/delete_account.dart';
import 'package:need2give/screens/common/edit_phone.dart';
import 'package:need2give/screens/common/about_us.dart';
import 'package:need2give/screens/common/terms.dart';
import 'package:need2give/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditPhone(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.phone,
                    size: 24.0,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Change phone number",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Terms(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.description,
                    size: 24.0,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Terms and Conditions",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUs(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.email,
                    size: 24.0,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "About us",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeleteAccount(),
                    ),
                  );
                },
                child: const Text(
                  "Delete Account",
                  style: TextStyle(
                    color: Global.markerColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () async {
                  _confirmLogout(context);
                },
                child: const Text("Log out"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _confirmLogout(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Log out"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text("Log out"),
              onPressed: () async {
                Provider.of<AuthProvider>(context, listen: false)
                    .setAccount("", AccountType.none);
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("token", "");
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, WelcomeScreen.routeName);
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  onTapArrowleft2(BuildContext context) {
    Navigator.pop(context);
  }
}
