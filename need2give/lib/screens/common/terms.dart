import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/widgets/back_button.dart' as widgets;

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        leading: const widgets.BackButton(),
        centerTitle: true,
        title: const Text("Terms And Conditions"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 64,
                  child: Image.asset("assets/logo_64.png"),
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Welcome to Need2Give, a platform for connecting users who need items with donation centers who have items to give away. By using this app, you agree to the following terms and conditions:',
              ),
              const SizedBox(height: 16),
              const Text(
                '1. Eligibility',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'You must be 13 years or older to use this app. If you are under 13, you may only use the app with the supervision and consent of a parent or guardian.',
              ),
              const SizedBox(height: 16),
              const Text(
                '2. User Conduct',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'You agree to use the app for lawful purposes only, and not to engage in any conduct that could harm the app, its users, or its donation centers.',
              ),
              const SizedBox(height: 16),
              const Text(
                '3. Privacy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'We respect your privacy and will never share your personal information with third parties without your consent. However, we may collect anonymous usage data to improve the app\'s performance and user experience.',
              ),
              const SizedBox(height: 16),
              const Text(
                '4. Disclaimer of Warranties',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'We make no guarantees about the accuracy, reliability, or completeness of any information provided by donation centers on this app. Users are responsible for verifying the accuracy of any information before acting on it.',
              ),
              const SizedBox(height: 16),
              const Text(
                '5. Limitation of Liability',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'We are not responsible for any damages resulting from the use or inability to use the app, or from any information provided by donation centers on this app.',
              ),
              const SizedBox(height: 16),
              const Text(
                'By using this app, you agree to these terms and conditions. If you do not agree with any of these terms, you should not use the app.',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
