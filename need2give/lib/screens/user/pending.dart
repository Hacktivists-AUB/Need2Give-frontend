import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/screens/auth/login.dart';

class PendingPage extends StatelessWidget {
  static const routeName = "/pendingPageUser";
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
              const SizedBox(height: 6),
              Text(
                "An email has been sent to $email",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              const Text("Please verify your email and log in."),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Confirmed email?",
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
                      "Log in",
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
