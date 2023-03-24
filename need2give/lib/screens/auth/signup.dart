import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/screens/auth/login.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/schedule.dart';
import 'package:need2give/widgets/textfield.dart';

enum UserType {
  notSelected,
  user,
  donationCenter,
}

class SignUp extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  UserType _userType = UserType.notSelected;
  final _signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _confirmPassController.dispose();
    _phoneController.dispose();
    _descriptionController.dispose();
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
              Image.asset('assets/image5.jpg'),
              Container(
                decoration: const BoxDecoration(
                  color: Global.lightGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                child: Column(
                  children: [
                    const Text(
                      "Let's get started",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Sign up as a: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Global.mediumGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: const Text(
                        "User",
                      ),
                      leading: Radio(
                        activeColor: Global.darkGreen,
                        value: UserType.user,
                        groupValue: _userType,
                        onChanged: (UserType? val) {
                          setState(() {
                            _userType = val!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Donation center",
                      ),
                      leading: Radio(
                        activeColor: Global.darkGreen,
                        value: UserType.donationCenter,
                        groupValue: _userType,
                        onChanged: (UserType? val) {
                          setState(() {
                            _userType = val!;
                          });
                        },
                      ),
                    ),
                    const Divider(),
                    if (_userType == UserType.user)
                      Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Email: ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Input(
                                controller: _emailController,
                                hintText: 'Email'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Username: ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Input(
                                controller: _usernameController,
                                hintText: 'Username'),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Phone number*: ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            PhoneInput(controller: _phoneController),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Password:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Input(
                              controller: _passwordController,
                              hintText: "Password",
                              secret: true,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Confirm password:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Input(
                              controller: _confirmPassController,
                              hintText: "Confirm password",
                              secret: true,
                            ),
                            const SizedBox(height: 20),
                            Button(
                                text: 'Sign up',
                                onPressed: () {
                                  if (_signUpFormKey.currentState!
                                      .validate()) {}
                                }),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: SignInButton(
                                Buttons.Google,
                                text: "Sign up with Google",
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Login.routeName);
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
                    if (_userType == UserType.donationCenter)
                      Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Email: ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Input(
                              controller: _emailController,
                              hintText: 'Email',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Username: ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Input(
                              controller: _usernameController,
                              hintText: 'Username',
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Phone number*: ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            PhoneInput(controller: _phoneController),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Description*: ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Input(
                              controller: _descriptionController,
                              hintText: "Description",
                              numberOfLines: 4,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Working hours*: ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.schedule),
                                  onPressed: () {
                                    generateScheduler(context);
                                  },
                                ),
                                TextButton(
                                  onPressed: () {
                                    generateScheduler(context);
                                  },
                                  child: const Text(
                                    "Pick working days and hours",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Global.darkGreen,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Password:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Input(
                              controller: _passwordController,
                              hintText: "Password",
                              secret: true,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Confirm password:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Global.mediumGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Input(
                              controller: _confirmPassController,
                              hintText: "Confirm password",
                              secret: true,
                            ),
                            const SizedBox(height: 20),
                            Button(
                                text: 'Sign up',
                                onPressed: () {
                                  if (_signUpFormKey.currentState!
                                      .validate()) {}
                                }),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: SignInButton(
                                Buttons.Google,
                                text: "Sign up with Google",
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Login.routeName);
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void generateScheduler(BuildContext context) => showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Select working hours',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Global.mediumGrey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 16),
                  Container(
                    decoration: const BoxDecoration(
                      color: Global.lightGrey,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: const [
                        WeekdayPicker(),
                        SizedBox(height: 10),
                        TimePicker(label: "Start time "),
                        SizedBox(height: 10),
                        TimePicker(label: "  End time "),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Button(
                    text: "Submit",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
}
