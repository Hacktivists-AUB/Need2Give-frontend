import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/constants/utils.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/models/account.dart';
import 'package:need2give/models/user.dart';
import 'package:need2give/screens/auth/login.dart';
import 'package:need2give/services/auth_service.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/location_picker.dart';
import 'package:need2give/widgets/schedule.dart';
import 'package:need2give/widgets/textfield.dart';

class SignUp extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AccountType _accountType = AccountType.none;
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

  late Account _profile;

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
      profile: _profile,
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
                          value: AccountType.user,
                          groupValue: _accountType,
                          onChanged: (AccountType? val) {
                            setState(() {
                              _accountType = val!;
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
                          value: AccountType.donationCenter,
                          groupValue: _accountType,
                          onChanged: (AccountType? val) {
                            setState(() {
                              _accountType = val!;
                            });
                          },
                        ),
                      ),
                      const Divider(),
                      if (_accountType == AccountType.user) _generateUserForm(),
                      if (_accountType == AccountType.donationCenter)
                        _generateDonationCenterForm(),
                      if (_accountType != AccountType.none)
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
              child: const IconTextButton(
                icon: Icons.calendar_month,
                label: "Select your birthday",
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
              child: const IconTextButton(
                icon: Icons.schedule,
                label: "Select working hours",
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
              child: const IconTextButton(
                icon: Icons.location_pin,
                label: "Select your location",
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
                _profile = _accountType == AccountType.user
                    ? UserDTO(
                        username: _usernameController.text,
                        email: _emailController.text,
                        fullName: _nameController.text,
                        password: _passwordController.text,
                        birthDate:
                            DateFormat('yyyy/MM/dd').format(_selectedDate),
                      )
                    : DonationCenterDTO(
                        username: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        name: _nameController.text,
                        latitude: _selectedLocation.latitude,
                        longitude: _selectedLocation.longitude,
                        openingTime: _selectedSchedule["opening_time"],
                        closingTime: _selectedSchedule["closing_time"],
                        description: _descriptionController.text,
                        openingDays: _selectedSchedule["opening_days"],
                      );
                signUp();
              }
            },
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
