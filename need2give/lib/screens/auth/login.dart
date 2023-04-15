import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/screens/auth/signup.dart';
import 'package:need2give/services/auth_service.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();

  final ScrollController _scrollController = ScrollController();
  bool _isPageScrolled = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void login() {
    authService.login(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 20),
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
                          const Divider(),
                          const SizedBox(height: 10),
                          const Label(text: "Email: "),
                          Input(
                              controller: _emailController, hintText: 'Email'),
                          const SizedBox(height: 10),
                          const Label(text: "Password: "),
                          Input(
                            controller: _passwordController,
                            hintText: 'Password',
                            secret: true,
                          ),
                          const SizedBox(height: 20),
                          Button(
                              text: 'Log in',
                              onPressed: () {
                                if (_loginFormKey.currentState!.validate()) {
                                  login();
                                }
                              }),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: SignInButton(
                              Buttons.Google,
                              text: "Log in with Google",
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, SignUp.routeName);
                                },
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
        ],
      ),
    );
  }
}
