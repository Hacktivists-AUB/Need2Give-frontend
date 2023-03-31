// ignore_for_file: avoid_print, camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';

import '../../../widgets/backButton.dart';

class changePassword extends StatefulWidget {
  const changePassword({super.key});

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<changePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(),
        title: Text('Change Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Input(controller: _emailController, hintText: "Email"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Input(
                    controller: _oldPasswordController,
                    hintText: "Old Password ",
                    secret: true),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Input(
                    controller: _newPasswordController,
                    hintText: "New Password ",
                    secret: true),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Input(
                  controller: _confirmPasswordController,
                  hintText: "Confirm New Password",
                  secret: true,
                ),
              ),
              Button(
                text: "Send email",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
