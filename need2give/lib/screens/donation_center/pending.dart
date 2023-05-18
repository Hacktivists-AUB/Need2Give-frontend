import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/screens/auth/login.dart';

class PendingPage extends StatelessWidget {
  static const routeName = "/pendingPageDonationCenter";
  final String email;
  const PendingPage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/logo_100.png"),
              const SizedBox(height: 36),
              const Text("Thanks for joining Need2Give!"),
              const SizedBox(height: 8),
              Text(
                "An email has been sent to $email",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                "Please verify your email so that our admins review your application.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text("Expect an email that confirms your registration."),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already recieved confirmation?",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Login.routeName,
                      );
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Global.mediumGreen,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
