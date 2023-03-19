import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.lightGrey,
      body: Container(
        color: Global.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/image4.jpg'),
              Container(
                decoration: const BoxDecoration(
                  color: Global.lightGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        const Text(
                          "Welcome back!",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Enter your email:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Global.mediumGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        InputBox(
                            controller: _emailController, hintText: 'Email'),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Enter your password:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Global.mediumGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        InputBox(
                            controller: _passwordController,
                            hintText: 'Password'),
                        const SizedBox(height: 20),
                        Button(text: 'Log in', onPressed: () {}),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Dont have an account?',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Sign up',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
