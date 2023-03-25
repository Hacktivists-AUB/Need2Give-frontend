import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/screens/auth/login.dart';
import 'package:need2give/services/auth_service.dart';
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
  final _phoneFieldKey = GlobalKey<PhoneInputState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final AuthService authService = AuthService();

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

  void signUp() {
    authService.signUp(
      context: context,
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      phone: _phoneFieldKey.currentState?.number
    );
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
                    const Label(text: "Sign up as a: "),
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
                    if (_userType == UserType.user) generateUserForm(),
                    if (_userType == UserType.donationCenter)
                      generateDonationCenterForm(),
                    if (_userType != UserType.notSelected)
                      generateSignUpButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget generateUserForm() => Form(
        key: _signUpFormKey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Label(text: "Email: "),
            Input(controller: _emailController, hintText: 'Email'),
            const SizedBox(height: 10),
            const Label(text: "Username: "),
            Input(controller: _usernameController, hintText: 'Username'),
            const SizedBox(height: 10),
            const Label(text: "Phone number*: "),
            PhoneInput(key: _phoneFieldKey, controller: _phoneController),
            const SizedBox(height: 10),
            generateConfirmPasswordFields(),
            const SizedBox(height: 20),
          ],
        ),
      );

  Widget generateDonationCenterForm() => Form(
        key: _signUpFormKey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Label(text: "Email"),
            Input(
              controller: _emailController,
              hintText: 'Email',
            ),
            const SizedBox(height: 10),
            const Label(text: "Username"),
            Input(
              controller: _usernameController,
              hintText: 'Username',
            ),
            const SizedBox(height: 10),
            const Label(text: "Phone number*: "),
            PhoneInput(controller: _phoneController),
            const SizedBox(height: 10),
            const Label(text: "Description*: "),
            Input(
              controller: _descriptionController,
              hintText: "Description",
              numberOfLines: 4,
            ),
            const SizedBox(height: 10),
            const Label(text: "Working hours*: "),
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
            generateConfirmPasswordFields(),
            const SizedBox(height: 20),
          ],
        ),
      );

  Widget generateConfirmPasswordFields() => Column(
        children: [
          const Label(text: "Password: "),
          Input(
            controller: _passwordController,
            hintText: "Password",
            secret: true,
          ),
          const Label(text: "Confirm password: "),
          Input(
            controller: _confirmPassController,
            hintText: "Confirm password",
            secret: true,
          ),
        ],
      );

  Widget generateSignUpButtons() => Column(
        children: [
          Button(
              text: 'Sign up',
              onPressed: () {
                // if (_signUpFormKey.currentState!.validate()) {

                // }
                signUp();
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
                  Navigator.pushNamed(context, Login.routeName);
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
      );

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
