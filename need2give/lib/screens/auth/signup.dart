import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:latlong2/latlong.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';
import 'package:need2give/screens/auth/login.dart';
import 'package:need2give/services/auth_service.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/location_picker.dart';
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

  final ScrollController _scrollController = ScrollController();
  bool _isPageScrolled = false;

  late DateTime _selectedDate;
  late LatLng _selectedLocation;
  late Map<String, dynamic> _selectedSchedule;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      _isPageScrolled = _scrollController.offset > 360;
    });
  }

  void _onLocationSelected(LatLng loc) {
    setState(() {
      _selectedLocation = loc;
    });
  }

  void _onScheduleSelected(Map<String, dynamic> schedule) {
    setState(() {
      _selectedSchedule = schedule;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
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
      phone: _phoneFieldKey.currentState?.number,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.lightGrey,
      appBar: AppBar(
        backgroundColor: _isPageScrolled ? Colors.transparent : Global.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Global.darkGrey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
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
                      if (_userType == UserType.user) _generateUserForm(),
                      if (_userType == UserType.donationCenter)
                        _generateDonationCenterForm(),
                      if (_userType != UserType.notSelected)
                        _generateSignUpButtons(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _generateUserForm() => Form(
        key: _signUpFormKey,
        child: Column(
          children: [
            const Label(text: "Full name : "),
            Input(controller: _nameController, hintText: 'Full name'),
            const SizedBox(height: 10),
            const Label(text: "Email : "),
            Input(controller: _emailController, hintText: 'Email'),
            const SizedBox(height: 10),
            const Label(text: "Username : "),
            Input(controller: _usernameController, hintText: 'Username'),
            const SizedBox(height: 10),
            const Label(text: "Phone number* : "),
            PhoneInput(
              key: _phoneFieldKey,
              controller: _phoneController,
              required: false,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () async {
                await _generateCalendar(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.calendar_month,
                      color: Global.mediumGrey,
                      size: 32,
                    ),
                  ),
                  Text(
                    "Select your birthday",
                    style: TextStyle(
                      fontSize: 16,
                      color: Global.darkGreen,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _generateConfirmPasswordFields(),
            const SizedBox(height: 20),
          ],
        ),
      );

  Widget _generateDonationCenterForm() => Form(
        key: _signUpFormKey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Label(text: "Email : "),
            Input(
              controller: _emailController,
              hintText: 'Email',
            ),
            const SizedBox(height: 10),
            const Label(text: "Username : "),
            Input(
              controller: _usernameController,
              hintText: 'Username',
            ),
            const SizedBox(height: 10),
            const Label(text: "Name : "),
            Input(
              controller: _nameController,
              hintText: 'Name',
            ),
            const SizedBox(height: 10),
            const Label(text: "Phone number* : "),
            PhoneInput(controller: _phoneController, required: false),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext buildContext) {
                    return Schedule(onConfirm: _onScheduleSelected);
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.schedule,
                      color: Global.mediumGrey,
                      size: 32,
                    ),
                  ),
                  Text(
                    "Select working hours",
                    style: TextStyle(
                      fontSize: 16,
                      color: Global.darkGreen,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return LocationPicker(onConfirm: _onLocationSelected);
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.location_pin,
                      color: Global.mediumGrey,
                      size: 32,
                    ),
                  ),
                  Text(
                    "Select your location",
                    style: TextStyle(
                      fontSize: 16,
                      color: Global.darkGreen,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Label(text: "Description* : "),
            Input(
              controller: _descriptionController,
              hintText: "Description",
              numberOfLines: 4,
              required: false,
            ),
            const SizedBox(height: 10),
            _generateConfirmPasswordFields(),
            const SizedBox(height: 20),
          ],
        ),
      );

  Future<void> _generateCalendar(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(initialDate.year - 100),
      lastDate: initialDate,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (newDate != null) {
      setState(() {
        _selectedDate = newDate;
      });
    }
  }

  Widget _generateConfirmPasswordFields() => Column(
        children: [
          const Label(text: "Password : "),
          Input(
            controller: _passwordController,
            hintText: "Password",
            secret: true,
          ),
          const Label(text: "Confirm password : "),
          Input(
            controller: _confirmPassController,
            hintText: "Confirm password",
            secret: true,
          ),
        ],
      );

  Widget _generateSignUpButtons() => Column(
        children: [
          Button(
              text: 'Sign up',
              onPressed: () {
                if (_passwordController.text != _confirmPassController.text) {
                  showSnackBar(context, "Passwords don't match. Try again.");
                  return;
                }
                if (_signUpFormKey.currentState!.validate()) {
                  signUp();
                }
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
}
