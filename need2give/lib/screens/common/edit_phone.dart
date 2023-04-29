import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/provider/auth_provider.dart';
import 'package:need2give/services/auth_service.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';
import 'package:provider/provider.dart';

class EditPhone extends StatefulWidget {
  const EditPhone({super.key});

  @override
  State<EditPhone> createState() => _EditPhoneState();
}

class _EditPhoneState extends State<EditPhone> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void editPhone(BuildContext ctx) async {
    await _authService.editPhoneNumber(
      context: ctx,
      email: _emailController.text,
      password: _passwordController.text,
      phoneNumber: _phoneController.text,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AuthProvider>(context).profile;
    _emailController.text = account.email;
    _phoneController.text = account.phoneNumber ?? "";
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        title: const Text("Edit phone number"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Label(text: "Email: "),
                Input(
                  controller: _emailController,
                  hintText: "Email",
                  required: true,
                ),
                const SizedBox(height: 12),
                const Label(text: "Phone number: "),
                PhoneInput(controller: _phoneController),
                const Label(text: "Password: "),
                Input(
                  controller: _passwordController,
                  hintText: "Password",
                  secret: true,
                ),
                const SizedBox(height: 18),
                Button(
                  text: "Save",
                  onPressed: () {
                    editPhone(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
